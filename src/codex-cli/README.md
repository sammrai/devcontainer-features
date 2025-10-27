# OpenAI Codex CLI

Installs OpenAI Codex CLI on Debian/Ubuntu-based containers with Node.js and nvm support.

## Features

- Installs nvm (Node Version Manager)
- Installs Node.js LTS (default: version 22)
- Installs OpenAI Codex CLI via npm
- Supports both global and local installation

## Options

| Option | Default | Description |
|--------|---------|-------------|
| `nodeVersion` | `22` | Node.js LTS version to install |
| `installGlobally` | `true` | Install Codex CLI globally (recommended) |

## Usage

Basic installation:

```json
{
  "features": {
    "ghcr.io/sammrai/devcontainer-features/codex-cli:1": {}
  }
}
```

With custom Node.js version:

```json
{
  "features": {
    "ghcr.io/sammrai/devcontainer-features/codex-cli:1": {
      "nodeVersion": "20"
    }
  }
}
```

## Prerequisites

Before using Codex CLI, ensure you have:

1. **Node.js and npm installed** (automatically installed by this feature)
   - Verify with: `node --version` and `npm --version`

2. **OpenAI Account** with one of the following:
   - Paid ChatGPT plan (Plus / Pro / Team)
   - OpenAI API key (usage-based billing applies)

## Getting Started

After installation, start Codex CLI by running:

```bash
codex
```

On first launch, you'll need to authenticate with your OpenAI account or provide your API key.

## Authentication Methods

### Method 1: ChatGPT Account (Recommended)
If you have a paid ChatGPT plan, authenticate through the browser when prompted.

### Method 2: API Key
If using an API key:
1. Set the environment variable: `export OPENAI_API_KEY=your-api-key`
2. Run `codex`

Note: API usage will incur charges based on OpenAI's pricing.

## Requirements

- Debian or Ubuntu-based container
- Internet connection for downloading Node.js and npm packages
- OpenAI account with paid plan or API key

## More Information

For more details about Codex CLI, visit:
- npm package: https://www.npmjs.com/package/@openai/codex
- OpenAI Platform: https://platform.openai.com/
