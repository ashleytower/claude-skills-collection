# Contributing to Claude Skills Collection

Thank you for your interest in contributing! This guide will help you create, organize, and submit high-quality Claude skills.

## Table of Contents

- [Quick Start](#quick-start)
- [Skill Structure](#skill-structure)
- [Creating a New Skill](#creating-a-new-skill)
- [Skill Metadata Standards](#skill-metadata-standards)
- [Testing Your Skill](#testing-your-skill)
- [Submission Guidelines](#submission-guidelines)
- [Code of Conduct](#code-of-conduct)

## Quick Start

### Prerequisites

- Git installed and configured
- Python 3.8+ (for Python-based skills)
- Claude Code or Claude Desktop for testing
- Text editor or IDE

### Creating Your First Skill

```bash
# 1. Fork and clone the repository
git clone https://github.com/YOUR_USERNAME/claude-skills-collection.git
cd claude-skills-collection

# 2. Create a new branch
git checkout -b skill/your-skill-name

# 3. Create skill directory
mkdir -p skills/your-skill-name

# 4. Copy the template
cp templates/SKILL.md skills/your-skill-name/SKILL.md

# 5. Edit your skill
# Open skills/your-skill-name/SKILL.md and customize it

# 6. Test your skill
# Test in Claude Code by placing it in your project's skills/ directory

# 7. Create ZIP for Claude Desktop
cd skills/your-skill-name
zip -r your-skill-name-skill.zip SKILL.md

# 8. Commit and push
git add skills/your-skill-name/
git commit -m "Add your-skill-name skill"
git push origin skill/your-skill-name

# 9. Open a Pull Request
# Go to GitHub and create a PR from your branch
```

## Skill Structure

### Required Directory Structure

Every skill must follow this structure:

```
skills/
└── your-skill-name/
    ├── SKILL.md                    # REQUIRED: Main skill definition
    ├── your-skill-name-skill.zip   # REQUIRED: For Claude Desktop
    ├── README.md                   # OPTIONAL: Additional documentation
    ├── scripts/                    # OPTIONAL: Supporting scripts
    │   └── helper.py
    ├── data/                       # OPTIONAL: Sample data or configs
    │   └── sample_config.json
    └── examples/                   # OPTIONAL: Usage examples
        └── example_usage.md
```

### Naming Conventions

**Skill Directory Names:**
- Use lowercase with hyphens: `pdf-processor`, `email-automation`
- Be descriptive but concise: `youtube-transcript-downloader` ✅ not `ytdl` ❌
- Avoid generic names: `invoice-organizer` ✅ not `organizer` ❌

**File Names:**
- Main skill file: `SKILL.md` (always uppercase)
- ZIP file: `{skill-name}-skill.zip`
- Supporting scripts: lowercase with underscores: `template_processor.py`

## Creating a New Skill

### Step 1: Define Your Skill's Purpose

Answer these questions before starting:

1. **What problem does it solve?**
2. **When should Claude use this skill?**
3. **What tools does it need?** (Bash, Read, Write, API, etc.)
4. **What are the inputs and outputs?**
5. **What are common edge cases or errors?**

### Step 2: Write the SKILL.md

Your `SKILL.md` must have this structure:

```markdown
---
name: your-skill-name
description: Clear, concise description of when Claude should use this skill
allowed-tools:
  - Bash
  - Read
  - Write
---

# Skill Name

Brief overview of what this skill does.

## When to Use This Skill

- Clear trigger conditions
- Specific use cases
- User request patterns

## How It Works

Step-by-step explanation of the skill's operation.

## Instructions

Detailed instructions for Claude to follow.

### Step 1: [Action]
[Detailed instructions]

### Step 2: [Action]
[Detailed instructions]

## Examples

### Example 1: [Scenario]
[Show input/output]

### Example 2: [Scenario]
[Show input/output]

## Error Handling

Common issues and solutions.

## Tips and Best Practices

Helpful guidance for optimal use.
```

### Step 3: Add Metadata (YAML Frontmatter)

**Required Fields:**
```yaml
---
name: skill-name
description: When Claude should use this skill (be specific!)
allowed-tools:
  - Bash
  - Read
  - Write
---
```

**Optional Fields:**
```yaml
---
name: skill-name
description: Skill description
allowed-tools:
  - Bash
  - Read
  - Write
  - API
requirements:
  - yt-dlp (pip install yt-dlp)
  - ffmpeg (brew install ffmpeg)
version: 1.0.0
author: Your Name
license: MIT
tags:
  - pdf
  - document-processing
  - automation
---
```

## Skill Metadata Standards

### `allowed-tools` Reference

**File Operations:**
- `Read` - Read files from filesystem
- `Write` - Create/overwrite files
- `Edit` - Modify existing files

**System Operations:**
- `Bash` - Execute shell commands

**External Operations:**
- `API` - Make HTTP/API requests
- `MCP` - Use Model Context Protocol servers

### `description` Best Practices

**Good descriptions are specific and actionable:**

✅ **GOOD:**
```yaml
description: Downloads YouTube video transcripts using yt-dlp, with Whisper fallback if no subtitles are available. Use when user provides a YouTube URL and requests transcript, captions, or subtitles.
```

❌ **BAD:**
```yaml
description: Handles YouTube videos
```

**Description Checklist:**
- [ ] Clearly states WHAT the skill does
- [ ] Specifies WHEN Claude should use it
- [ ] Mentions key tools or methods used
- [ ] Describes primary use cases

## Testing Your Skill

### Test in Claude Code

1. **Place skill in project:**
```bash
# In your test project directory
mkdir -p skills/
cp -r /path/to/claude-skills-collection/skills/your-skill-name skills/
```

2. **Open Claude Code in that project:**
```bash
cd your-test-project
claude-code
```

3. **Test with prompts:**
```
Hey Claude, use the your-skill-name skill to [specific task]
```

### Test in Claude Desktop

1. **Create ZIP:**
```bash
cd skills/your-skill-name
zip -r your-skill-name-skill.zip SKILL.md
```

2. **Import to Claude Desktop:**
   - Open Claude Desktop
   - Profile → Skills → Import Skill
   - Select the ZIP file

3. **Test with conversation:**
```
I need to [task that skill handles]
```

### Testing Checklist

- [ ] Skill activates with appropriate prompts
- [ ] Instructions are clear and unambiguous
- [ ] Error handling works for edge cases
- [ ] Examples are accurate and helpful
- [ ] Tool permissions are correct and minimal
- [ ] Works in both Claude Code and Desktop (if applicable)

## Submission Guidelines

### Before Submitting

1. **Follow the structure:**
   - [ ] Skill in `skills/{skill-name}/` directory
   - [ ] Contains `SKILL.md` with proper YAML frontmatter
   - [ ] Includes `{skill-name}-skill.zip` file
   - [ ] Has descriptive directory name

2. **Code quality:**
   - [ ] SKILL.md is well-formatted markdown
   - [ ] YAML frontmatter is valid
   - [ ] No typos or grammatical errors
   - [ ] Examples are tested and accurate

3. **Documentation:**
   - [ ] Clear description of purpose
   - [ ] "When to Use" section is specific
   - [ ] Instructions are step-by-step
   - [ ] Examples demonstrate key use cases
   - [ ] Error handling is documented

4. **Testing:**
   - [ ] Tested in Claude Code
   - [ ] Tested in Claude Desktop (if applicable)
   - [ ] Edge cases handled
   - [ ] Examples verified

### Pull Request Process

1. **Create descriptive PR title:**
   ```
   Add [skill-name] skill for [purpose]
   ```

2. **Fill out PR description:**
   ```markdown
   ## Skill Name
   [skill-name]

   ## Purpose
   [What problem does it solve?]

   ## Testing
   - [x] Tested in Claude Code
   - [x] Tested in Claude Desktop
   - [x] Examples verified

   ## Checklist
   - [x] Follows directory structure
   - [x] Includes SKILL.md and ZIP
   - [x] Documentation complete
   - [x] No duplicate functionality
   ```

3. **Wait for review:**
   - Maintainers will review your submission
   - Address any feedback promptly
   - Be open to suggestions

4. **After approval:**
   - Maintainer will merge your PR
   - Your skill becomes part of the collection!

### What We Look For

**Accept:**
- ✅ Solves a specific, useful problem
- ✅ Well-documented and tested
- ✅ Follows conventions
- ✅ Minimal tool permissions needed
- ✅ Clear instructions for Claude

**Reject:**
- ❌ Duplicate of existing skill
- ❌ Malicious or harmful intent
- ❌ Poor documentation
- ❌ Overly broad or vague purpose
- ❌ Requires excessive permissions

## Skill Categories

We organize skills into categories. Choose the most appropriate:

**Technical Implementation:**
- Document processing (PDF, Excel, Word, PowerPoint)
- Web scraping and data extraction
- API integration
- File automation
- Media processing

**Development Tools:**
- Code generation
- Testing automation
- CI/CD integration
- Documentation generation

**Productivity:**
- Email automation
- Calendar management
- Note-taking and organization
- Research and writing

**Creative:**
- Design automation
- Content generation
- Media creation
- Branding tools

**AI Agent Integration:**
- Claude SDK integration
- Multi-agent workflows
- Context management
- Tool orchestration

## Best Practices

### Writing Clear Instructions

**Use action-oriented language:**
```markdown
## Instructions

1. **Check if tool is installed**
   Run `which yt-dlp` to verify installation.

2. **Download transcript**
   Execute: `yt-dlp --write-auto-sub --skip-download "URL"`

3. **Convert to text**
   Parse VTT file and extract text content.
```

**Not vague statements:**
```markdown
## Instructions

The skill downloads transcripts from videos.
```

### Minimal Tool Permissions

Request only tools you actually need:

**Good (minimal):**
```yaml
allowed-tools:
  - API
```

**Bad (excessive):**
```yaml
allowed-tools:
  - Bash
  - Read
  - Write
  - API
  - MCP
  - Edit
```

### Error Handling

Always document common errors:

```markdown
## Error Handling

### Tool not installed
**Error:** `command not found: yt-dlp`
**Solution:** Install with `pip install yt-dlp`

### No subtitles available
**Error:** `No subtitles found`
**Solution:** Offer Whisper transcription as fallback
```

## For AI Agent Developers

### Using Skills with Claude SDK

Skills can be programmatically integrated:

```python
from anthropic import Anthropic

# Load skill content
with open('skills/your-skill/SKILL.md', 'r') as f:
    skill_content = f.read()

# Include in system prompt
client = Anthropic(api_key="your-api-key")
message = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    max_tokens=1024,
    system=f"{skill_content}\n\nUse this skill to complete the user's request.",
    messages=[
        {"role": "user", "content": "Download transcript from [YouTube URL]"}
    ]
)
```

### Multi-Skill Agents

Load multiple skills for complex workflows:

```python
skills = []
for skill_name in ['pdf-processor', 'email-automation', 'data-analyzer']:
    with open(f'skills/{skill_name}/SKILL.md', 'r') as f:
        skills.append(f.read())

system_prompt = "\n\n".join(skills) + "\n\nComplete the multi-step task."
```

## Code of Conduct

### Our Standards

**Be respectful:**
- Use welcoming and inclusive language
- Respect differing viewpoints
- Accept constructive criticism gracefully

**Be helpful:**
- Provide clear, actionable feedback
- Help others learn and improve
- Share knowledge generously

**Be professional:**
- Focus on constructive contributions
- Avoid personal attacks
- Maintain confidentiality

### Unacceptable Behavior

- Harassment, discrimination, or hate speech
- Malicious code or harmful skills
- Spamming or trolling
- Privacy violations

### Enforcement

Violations may result in:
1. Warning
2. Temporary ban
3. Permanent ban

Report issues to: [maintainer email]

## Questions?

- **Documentation:** Check [USAGE_GUIDE.md](USAGE_GUIDE.md)
- **Examples:** Browse existing skills in `skills/`
- **Issues:** Open a GitHub issue
- **Discussions:** Use GitHub Discussions

## Thank You!

Your contributions make this collection valuable for the entire Claude community. We appreciate your effort and creativity!

---

**Happy skill building!** 🚀
