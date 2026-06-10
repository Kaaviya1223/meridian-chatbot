# Meridian University — AI Admission Chatbot

An AI-powered university admission assistant built with **Google Gemini 2.5 Flash** and a **RAG (Retrieval-Augmented Generation)** architecture. Handles natural language queries about programmes and retrieves real-time applicant data from a SQLite database — with zero hallucination on sensitive details.

## Demo
[▶ Watch Demo](https://drive.google.com/file/d/1HJ6qPDG9Cm8tEYSXRQdPbkYOWfY7pINv/view?usp=sharing)

## Architecture

User Message
│
▼
Gemini 2.5 Flash — Intent Detection + Entity Extraction
│
├── status_check ──► Query SQLite by ref_no ──► Format response
│
└── programme_query ──► Fetch programmes ──► Gemini generates grounded answer

## Tech Stack
| Layer | Technology |
|-------|-----------|
| AI Model | Google Gemini 2.5 Flash (Vertex AI) |
| Architecture | RAG (Retrieval-Augmented Generation) |
| Backend | Node.js + Express |
| Database | SQLite via better-sqlite3 |
| Frontend | Vanilla HTML/CSS/JS |
| Auth | Google Cloud ADC |

## Key Features
- **Zero-shot intent detection** — classifies queries into status checks or programme enquiries without training examples
- **Entity extraction** — pulls reference numbers and programme names from natural language
- **Grounded responses** — all applicant data retrieved from database, never hallucinated by the model
- **14 programmes** — degrees, diplomas, foundations with fees, intake dates, entry requirements
- **Real-time status lookup** — retrieves full application details by reference number

## Project Structure

meridian-chatbot/
├── backend/
│   ├── server.js       # Express server + RAG logic
│   └── prompts.js      # Gemini system prompt
├── frontend/
│   └── index.html      # Chat UI
└── data/
├── seed.sql         # Schema + dummy data
└── meridian.db      # SQLite database

## Run Locally

### Prerequisites
- Node.js 18+
- Google Cloud account with Vertex AI enabled

### Setup
```bash
git clone https://github.com/Kaaviya1223/meridian-chatbot
cd meridian-chatbot
npm install
gcloud auth application-default login
```

Create `.env`:

GOOGLE_CLOUD_PROJECT=your-project-id
GOOGLE_CLOUD_LOCATION=us-central1
GOOGLE_GENAI_USE_VERTEXAI=true

Seed the database:
```bash
node -e "const Database=require('better-sqlite3');const fs=require('fs');const db=new Database('data/meridian.db');db.exec(fs.readFileSync('data/seed.sql','utf8'));console.log('Done');"
```

### Run
```bash
node backend/server.js
```
Open `http://localhost:3000`

## Sample Queries
| Query | Intent |
|-------|--------|
| What programmes do you offer? | programme_query |
| What is the fee for Bachelor of Computer Science? | programme_query |
| Which programmes have October intake? | programme_query |
| Check my application status. My ref no is MUM2603 | status_check |****
