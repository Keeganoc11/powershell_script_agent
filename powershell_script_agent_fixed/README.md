
# 🖥️ PowerShell Script Generator Agent (Fixed Version)

This agent lets you generate PowerShell scripts using natural language and OpenAI.

## ✅ Setup Instructions (Windows + VS Code)

1. **Install required packages:**
```bash
py -m pip install openai gradio python-dotenv
```

2. **Set your API key:**
Open the `.env` file in this folder and paste your actual OpenAI API key like this:
```
OPENAI_API_KEY=sk-xxxxxxxxxxxxxxxxxxxxxxxx
```

3. **Run the app:**
```bash
py ui.py
```

4. A browser window will launch. You can:
- Enter a PowerShell task in plain English
- View the generated script
- Save it automatically to the `scripts/` folder
- Share the session with coworkers via the public Gradio link

## 🧠 Example Prompts

- "Create a script that lists all services and saves to CSV"
- "Restart the Print Spooler service"
- "Check if the C: drive has less than 10% free space"

---
