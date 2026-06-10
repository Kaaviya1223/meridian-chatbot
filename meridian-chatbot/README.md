# Meridian University AI Admission Chatbot
AI-powered admission assistant using Google Gemini 2.5 Flash and RAG architecture.

## Tech Stack
- Node.js + Express
- Google Gemini 2.5 Flash (Vertex AI)
- RAG Architecture
- SQLite (better-sqlite3)
- Vanilla HTML/CSS/JS

## Features
- Zero-shot intent detection and entity extraction
- Real-time database retrieval grounding LLM responses
- Application status lookup by reference number
- Programme queries with fees, intake dates, requirements

## Run Locally
```bash
npm install
gcloud auth application-default login
node backend/server.js
```
