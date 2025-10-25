# Claude Skills Directory

This directory contains all Claude skills, organized and ready for use across Claude Code, Claude Desktop, and AI agents built with the Claude SDK.

## 📁 Directory Structure

Each skill follows this structure:
```
skills/
└── skill-name/
    ├── SKILL.md                    # Main skill definition (required)
    ├── skill-name-skill.zip        # Claude Desktop package (required)
    ├── README.md                   # Additional documentation (optional)
    ├── sample_prompt.md            # Example prompts (optional)
    ├── scripts/                    # Supporting Python scripts (optional)
    ├── data/                       # Sample data or configs (optional)
    └── templates/                  # Templates for the skill (optional)
```

## 🎯 Available Skills (8 Total)

### 🧠 Brainstorming
**Directory:** `brainstorming/`
**Description:** Transform rough ideas into fully-formed designs through structured Socratic questioning and iterative refinement.
**Tools:** Context-based (no tools specified)
**Origin:** Imported from obra/superpowers
**ZIP:** `brainstorming-skill.zip`

### 🎨 Brand Guidelines
**Directory:** `brand-guidelines/`
**Description:** Apply consistent corporate branding and styling to all generated documents including colors, fonts, layouts, and messaging.
**Tools:** Read, Write, Edit
**Origin:** Local development
**ZIP:** `brand-guidelines-skill.zip`

### ✍️ Content Research Writer
**Directory:** `content-research-writer/`
**Description:** Assists in writing high-quality content by conducting research, adding citations, improving hooks, and providing real-time feedback.
**Tools:** Context-based (no tools specified)
**Origin:** Imported from community
**ZIP:** `content-research-writer-skill.zip`

### 📧 Gmail Intelligence
**Directory:** `gmail-intelligence/`
**Description:** Analyze and extract insights from Gmail data, process email threads, and automate email-based workflows.
**Tools:** API, MCP
**Origin:** Local development
**ZIP:** `gmail-intelligence-skill.zip`
**Additional Files:** README.md, sample_prompt.md

### 📑 Invoice Organizer
**Directory:** `invoice-organizer/`
**Description:** Automatically organize invoices and receipts for tax preparation by reading messy files, extracting key information, and creating organized structure.
**Tools:** Bash, Read, Write, Edit
**Origin:** Local development
**ZIP:** `invoice-organizer-skill.zip`

### 📋 Notion Template Processor
**Directory:** `notion-template-processor/`
**Description:** Fill Notion database templates with data and deliver via email using Notion MCP integration.
**Tools:** MCP, API, Bash
**Origin:** Factory-generated
**ZIP:** `notion-template-processor-skill.zip`
**Additional Files:** sample_prompt.md, scripts/, data/, templates/

### 📄 PDF Processor
**Directory:** `pdf-processor/`
**Description:** Comprehensive PDF manipulation toolkit for extracting text and tables, creating new PDFs, merging/splitting documents, and handling forms.
**Tools:** Bash, Read, Write, Edit
**Origin:** Local development
**ZIP:** `pdf-processor-skill.zip`

### 🎥 YouTube Transcript Downloader
**Directory:** `youtube-transcript-downloader/`
**Description:** Download YouTube video transcripts using yt-dlp, with Whisper transcription fallback if no subtitles are available.
**Tools:** Bash, Read, Write
**Origin:** Local development
**ZIP:** `youtube-transcript-downloader-skill.zip`

## 📊 Skills by Category

### Document Processing
- **Brand Guidelines** - Corporate branding automation
- **Invoice Organizer** - Financial document organization
- **PDF Processor** - Comprehensive PDF manipulation

### Content & Research
- **Content Research Writer** - Research and citation management
- **YouTube Transcript Downloader** - Video transcript extraction

### Integration & Automation
- **Gmail Intelligence** - Email analysis and automation
- **Notion Template Processor** - Template filling and delivery

### Methodology & Process
- **Brainstorming** - Structured idea development

## 📦 Using Skills

### In Claude Code

Skills in this directory are automatically available. Reference them in conversations:

```
Hey Claude, use the pdf-processor skill to extract text from document.pdf
```

### In Claude Desktop

Import the ZIP file for any skill:

1. Open Claude Desktop
2. Profile → Skills → Import Skill
3. Select `skills/{skill-name}/{skill-name}-skill.zip`

### With Claude API/SDK

Load skills programmatically:

```python
from anthropic import Anthropic

# Load a skill
with open('skills/pdf-processor/SKILL.md', 'r') as f:
    skill_content = f.read()

# Use in your application
client = Anthropic(api_key="your-api-key")
response = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    max_tokens=4096,
    system=f"{skill_content}\n\nUse this skill to complete the task.",
    messages=[{"role": "user", "content": "Your request here"}]
)
```

## ⚡ Quick Reference

### Tool Permissions by Skill

| Skill | Bash | Read | Write | Edit | API | MCP |
|-------|------|------|-------|------|-----|-----|
| Brainstorming | - | - | - | - | - | - |
| Brand Guidelines | - | ✓ | ✓ | ✓ | - | - |
| Content Research Writer | - | - | - | - | - | - |
| Gmail Intelligence | - | - | - | - | ✓ | ✓ |
| Invoice Organizer | ✓ | ✓ | ✓ | ✓ | - | - |
| Notion Template Processor | ✓ | - | - | - | ✓ | ✓ |
| PDF Processor | ✓ | ✓ | ✓ | ✓ | - | - |
| YouTube Transcript Downloader | ✓ | ✓ | ✓ | - | - | - |

### Platform Compatibility

| Skill | Claude Code | Claude Desktop | Claude API |
|-------|-------------|----------------|------------|
| All Skills | ✓ | ✓ | ✓ |

**Note:** Skills with Bash/Read/Write tools work best in Claude Code. Skills with API/MCP work across all platforms.

## 🛠️ Adding New Skills

See [../CONTRIBUTING.md](../CONTRIBUTING.md) for complete guidelines.

Quick steps:
1. Create directory: `skills/your-skill-name/`
2. Add `SKILL.md` with proper frontmatter
3. Create ZIP: `zip -r your-skill-name-skill.zip SKILL.md`
4. Test across platforms
5. Submit PR

## 📚 Skill Standards

All skills in this directory follow these standards:

- ✅ Descriptive directory names (lowercase-with-hyphens)
- ✅ Required `SKILL.md` with YAML frontmatter
- ✅ Required `{skill-name}-skill.zip` for Claude Desktop
- ✅ Standardized metadata format (multi-line YAML lists)
- ✅ Clear "When to Use" sections
- ✅ Comprehensive examples and error handling
- ✅ Minimal tool permissions

## 🔗 Related Documentation

- [Main README](../README.md) - Repository overview
- [CONTRIBUTING.md](../CONTRIBUTING.md) - Contribution guidelines
- [USAGE_GUIDE.md](../USAGE_GUIDE.md) - Platform-specific usage
- [IMPORT_GUIDE.md](../IMPORT_GUIDE.md) - Importing from Git repos

## 📈 Statistics

- **Total Skills:** 8
- **With Supporting Scripts:** 1 (Notion Template Processor)
- **Imported Skills:** 2 (Brainstorming, Content Research Writer)
- **Local Skills:** 6
- **Average Lines per SKILL.md:** ~300

## 🎯 Skill Quality Metrics

All skills have been validated for:
- ✅ Valid YAML frontmatter
- ✅ Clear purpose and description
- ✅ Proper tool permissions
- ✅ Complete documentation
- ✅ ZIP file for distribution
- ✅ Cross-platform compatibility

---

**Need help?** Check the main [README.md](../README.md) or [open an issue](https://github.com/YOUR_USERNAME/claude-skills-collection/issues).
