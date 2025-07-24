
import os
from openai import OpenAI
from dotenv import load_dotenv

class PowerShellAgent:
    def __init__(self, model="gpt-4o"):
        load_dotenv()
        api_key = os.getenv("OPENAI_API_KEY")
        if not api_key:
            raise ValueError("❌ OPENAI_API_KEY not found in .env file.")
        print("✅ Loaded API key.")
        self.client = OpenAI(api_key=api_key)
        self.model = model

    def generate_script(self, prompt):
        system_prompt = "You are an assistant that writes safe and efficient PowerShell scripts based on user requests. Output only the script, no explanation."
        response = self.client.chat.completions.create(
            model=self.model,
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": prompt}
            ]
        )
        return response.choices[0].message.content.strip()
