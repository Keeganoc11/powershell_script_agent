
import gradio as gr
from agent import PowerShellAgent
import os
from datetime import datetime

agent = PowerShellAgent()

def generate_and_save_script(prompt):
    script = agent.generate_script(prompt)
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = f"scripts/script_{timestamp}.ps1"
    with open(filename, "w") as file:
        file.write(script)
    return script, f"✅ Script saved to {filename}"

iface = gr.Interface(
    fn=generate_and_save_script,
    inputs=gr.Textbox(label="Describe the PowerShell script you need", lines=3),
    outputs=[
    gr.Code(label="Generated Script"),
    gr.Text(label="Status")
],


    title="PowerShell Script Generator Agent",
    description="Enter a description of the PowerShell script you want. The agent will generate the script and save it to the 'scripts' folder."
)

if __name__ == "__main__":
    iface.launch(share=True)
