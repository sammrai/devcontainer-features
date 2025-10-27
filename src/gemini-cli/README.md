# Google Gemini CLI

Installs Google Gemini CLI on Debian/Ubuntu-based containers with Node.js and nvm support.

## Features

- Installs nvm (Node Version Manager)
- Installs Node.js LTS (default: version 22)
- Installs Google Gemini CLI via npm
- Supports both global and local installation

## Options

| Option | Default | Description |
|--------|---------|-------------|
| `nodeVersion` | `22` | Node.js LTS version to install |
| `installGlobally` | `true` | Install Gemini CLI globally (recommended) |

## Usage

Basic installation:

```json
{
  "features": {
    "ghcr.io/sammrai/devcontainer-features/gemini-cli:1": {}
  }
}
```

With custom Node.js version:

```json
{
  "features": {
    "ghcr.io/sammrai/devcontainer-features/gemini-cli:1": {
      "nodeVersion": "20"
    }
  }
}
```

## Getting Started

After installation, start Gemini CLI by running:

```bash
gemini
```

On first launch, you'll be prompted to:
1. Configure initial settings (press Enter for defaults)
2. Authenticate with your personal Google account (browser will open automatically)

Once authenticated, you can start chatting with Gemini in both Japanese and English.

## Usage Tips

- **Start Gemini CLI**: `gemini`
- **Exit Gemini CLI**: Press `Ctrl+C` twice
- **Supported languages**: Japanese, English, and other languages supported by Gemini

## Authentication

The CLI will link to your personal Google account during the first run. Follow the browser prompts to complete authentication.

## Requirements

- Debian or Ubuntu-based container
- Internet connection for downloading Node.js and npm packages
- Google account for authentication

## More Information

For more details about Gemini CLI, visit:
- npm package: https://www.npmjs.com/package/@google/gemini-cli
- Google AI Studio: https://aistudio.google.com/
