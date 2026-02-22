#!/usr/bin/env python3
import subprocess
import urllib.request
import urllib.error
import json
import os
import sys

# Configuration
API_KEY_FILE = os.path.expanduser("~/.config/gemini/api_key")
MODEL = "gemini-flash-latest"


def get_api_key():
    # 1. Check Env Var
    key = os.environ.get("GEMINI_API_KEY")
    if key:
        return key.strip()

    # 2. Check Config File
    if os.path.exists(API_KEY_FILE):
        with open(API_KEY_FILE, "r") as f:
            return f.read().strip()
    return None


def rofi_input(prompt="Gemini"):
    try:
        # Theme:
        # - listview disabled (input box only)
        # - prompt: added padding to right to separate from input
        # - entry: placeholder text
        theme_str = """
            window { width: 50%; padding: 20px; children: [inputbar]; }
            listview { enabled: false; }
            inputbar { children: [prompt, entry]; }
            prompt { padding: 0 12px 0 0; }
            entry { placeholder: "Ask me anything..."; }
        """

        result = subprocess.run(
            [
                "rofi",
                "-dmenu",
                "-p",
                prompt,
                "-theme-str",
                theme_str,
                "-kb-cancel",
                "Escape,Caps_Lock",
            ],
            input="",
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            check=False,
        )
        return result.stdout.strip()
    except FileNotFoundError:
        print("Error: rofi not found.")
        sys.exit(1)


def rofi_msg(message):
    # Theme: nicely padded window for reading text
    theme_str = """
        window { width: 60%; padding: 20px; border: 2px; }
        message { padding: 10px; }
        textbox { margin: 10px; }
    """
    subprocess.run(
        [
            "rofi",
            "-e",
            message,
            "-theme-str",
            theme_str,
            "-kb-cancel",
            "Escape,Caps_Lock",
        ]
    )


def pre_prompt(prompt):
    pre = "Do not use markdown syntax, just plain text. Return a concise, to the point, answer to this: "
    return pre + prompt


def call_gemini(prompt, api_key):
    url = f"https://generativelanguage.googleapis.com/v1beta/models/{MODEL}:generateContent?key={api_key}"
    headers = {"Content-Type": "application/json"}
    data = {"contents": [{"parts": [{"text": pre_prompt(prompt)}]}]}

    try:
        req = urllib.request.Request(
            url, data=json.dumps(data).encode("utf-8"), headers=headers
        )
        with urllib.request.urlopen(req) as response:
            result = json.loads(response.read().decode("utf-8"))
            try:
                return result["candidates"][0]["content"]["parts"][0]["text"]
            except (KeyError, IndexError):
                return "Error: Unexpected response format from Gemini."
    except urllib.error.HTTPError as e:
        return f"Error: {e.code} - {e.read().decode('utf-8')}"
    except Exception as e:
        return f"Error: {str(e)}"


def main():
    api_key = get_api_key()
    if not api_key:
        rofi_msg(
            "API Key not found.\nPlease create ~/.config/gemini/api_key with your key."
        )
        return

    # Get input
    prompt = rofi_input()
    if not prompt:
        return

    # Notify (optional, requires notify-send)
    subprocess.run(["notify-send", "Gemini", "Thinking..."], stderr=subprocess.DEVNULL)

    # Call API
    response = call_gemini(prompt, api_key)

    # Show result
    rofi_msg(response)


if __name__ == "__main__":
    main()
