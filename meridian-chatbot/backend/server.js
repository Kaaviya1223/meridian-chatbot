require('dotenv').config();
const express = require('express');
const cors = require('cors');
const Database = require('better-sqlite3');
const { GoogleGenAI } = require('@google/genai');
const { getSystemPrompt } = require('./prompts');

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.static('frontend'));

const db = new Database('data/meridian.db');
const ai = new GoogleGenAI({
  vertexai: true,
  project: process.env.GOOGLE_CLOUD_PROJECT,
  location: process.env.GOOGLE_CLOUD_LOCATION,
});

app.post('/api/chat', async (req, res) => {
  try {
    const { message } = req.body;
    const prompt = getSystemPrompt() + '\nUser message: "' + message + '"';
    const result = await ai.models.generateContent({ model: 'gemini-2.5-flash', contents: prompt });
    const text = result.text;
    let parsed;
    try {
      const jsonMatch = text.match(/\{[\s\S]*\}/);
      if (!jsonMatch) throw new Error('No JSON');
      parsed = JSON.parse(jsonMatch[0]);
    } catch {
      return res.json({ response: text.replace(/```json|```/g, '').trim() });
    }
    if (parsed.intent === 'status_check') {
      if (!parsed.ref_no) return res.json({ response: parsed.response || 'Please provide your reference number (format: MUM26XX).' });
      const applicant = db.prepare('SELECT * FROM applicants WHERE ref_no = ?').get(parsed.ref_no);
      if (applicant) {
        return res.json({ response: 'Here is your application status:\n\nName: ' + applicant.name + '\nProgramme: ' + applicant.programme + '\nStatus: ' + applicant.status + '\nPayment: ' + applicant.payment_status + '\nIntake: ' + applicant.intake });
      }
      return res.json({ response: 'I could not find an application with reference number ' + parsed.ref_no + '. Please double-check and try again.' });
    }
    if (parsed.intent === 'programme_query') {
      const programmes = db.prepare('SELECT * FROM programmes').all();
      const list = programmes.map(p => p.name + ' (' + p.level + ') - ' + p.duration + ', RM' + p.fees_per_sem + '/sem, Intake: ' + p.intake + ', Requirements: ' + p.min_requirement).join('\n');
      const r2 = await ai.models.generateContent({ model: 'gemini-2.5-flash', contents: 'You are an admission assistant for Meridian University Malaysia. Answer based ONLY on this data. Be concise and friendly.\nQuestion: "' + message + '"\nData:\n' + list });
      return res.json({ response: r2.text });
    }
    res.json({ response: parsed.response || 'I am here to help with programme information and application status checks.' });
  } catch (error) {
    console.error('Error:', error.message);
    res.status(500).json({ response: 'Sorry, something went wrong. Please try again.' });
  }
});

app.listen(3000, () => console.log('Meridian chatbot running on port 3000'));