# Claude Skills Collection

A comprehensive, organized collection of Claude AI skills with cross-platform deployment support for Claude Code, Claude Desktop, and AI agents built with the Claude SDK.

## 📦 What's Included

This repository provides a complete Claude skills ecosystem with:

- **8 Production-Ready Skills** for document processing, research, and productivity
- **Cross-Platform Support** for Claude Code, Claude Desktop, and Claude API/SDK
- **Complete Documentation** including usage guides, import guides, and contribution guidelines
- **Best Practices** for organizing, developing, and deploying Claude skills
- **Example Implementations** with Python scripts and real-world use cases

## 🚀 Quick Start

### For Claude Code Users

1. **Clone the repository:**
```bash
git clone https://github.com/YOUR_USERNAME/claude-skills-collection.git
cd claude-skills-collection
```

2. **Skills are automatically available!**
   - All skills in the `skills/` directory are immediately accessible
   - Reference them in conversations: "Use the pdf-processor skill to..."

### For Claude Desktop Users

1. **Import a skill:**
   - Open Claude Desktop
   - Go to Profile → Skills → Import Skill
   - Select a ZIP file from `skills/{skill-name}/{skill-name}-skill.zip`

2. **Available ZIP files:**
   - `skills/brainstorming/brainstorming-skill.zip`
   - `skills/brand-guidelines/brand-guidelines-skill.zip`
   - `skills/content-research-writer/content-research-writer-skill.zip`
   - `skills/gmail-intelligence/gmail-intelligence-skill.zip`
   - `skills/invoice-organizer/invoice-organizer-skill.zip`
   - `skills/notion-template-processor/notion-template-processor-skill.zip`
   - `skills/pdf-processor/pdf-processor-skill.zip`
   - `skills/youtube-transcript-downloader/youtube-transcript-downloader-skill.zip`

### For AI Agent Developers (Claude SDK)

```python
from anthropic import Anthropic

# Load a skill
with open('skills/pdf-processor/SKILL.md', 'r') as f:
    skill_content = f.read()

# Use with Claude API
client = Anthropic(api_key="your-api-key")
message = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    max_tokens=4096,
    system=f"{skill_content}\n\nUse this skill to complete the task.",
    messages=[{"role": "user", "content": "Extract text from document.pdf"}]
)
```

## 📊 Repository Structure

```
claude-skills-collection/
├── skills/                          # All skills organized here
│   ├── brainstorming/
│   │   ├── SKILL.md                 # Skill definition
│   │   └── brainstorming-skill.zip  # Claude Desktop package
│   ├── brand-guidelines/
│   ├── content-research-writer/
│   ├── gmail-intelligence/
│   ├── invoice-organizer/
│   ├── notion-template-processor/
│   ├── pdf-processor/
│   └── youtube-transcript-downloader/
├── examples/                        # Example implementations
│   ├── pdf-processing/              # PDF manipulation examples
│   └── brand-application/           # Brand automation examples
├── docs/                            # Additional documentation
│   ├── forms.md                     # PDF forms guide
│   └── REFERENCE.md                 # Technical reference
├── templates/                       # Skill creation templates
│   └── SKILL.md                     # Template for new skills
├── scripts/                         # Automation scripts
│   └── setup-github-repo.sh
├── .github/                         # GitHub configuration (coming soon)
├── CONTRIBUTING.md                  # Contribution guidelines
├── USAGE_GUIDE.md                   # Complete usage documentation
├── IMPORT_GUIDE.md                  # Skill import instructions
├── LICENSE                          # MIT License
└── README.md                        # This file
```

## 🎯 Available Skills

### 🧠 Brainstorming
**Path:** `skills/brainstorming/`
**Purpose:** Transform rough ideas into fully-formed designs through structured Socratic questioning and iterative refinement.
**Use When:** Creating or developing anything before writing code or implementation plans.

### 🎨 Brand Guidelines
**Path:** `skills/brand-guidelines/`
**Purpose:** Apply consistent corporate branding and styling to all generated documents including colors, fonts, layouts, and messaging.
**Use When:** Creating documents that need to follow corporate brand standards.

### ✍️ Content Research Writer
**Path:** `skills/content-research-writer/`
**Purpose:** Assists in writing high-quality content by conducting research, adding citations, improving hooks, and providing real-time feedback.
**Use When:** Writing blog posts, articles, tutorials, or any content requiring research and citations.

### 📧 Gmail Intelligence
**Path:** `skills/gmail-intelligence/`
**Purpose:** Analyze and extract insights from Gmail data, process email threads, and automate email-based workflows.
**Use When:** Need to analyze email patterns, extract information, or automate Gmail operations.

### 📑 Invoice Organizer
**Path:** `skills/invoice-organizer/`
**Purpose:** Automatically organize invoices and receipts for tax preparation by extracting key information and creating a clean filing system.
**Use When:** Preparing for tax season, managing business expenses, or organizing financial documents.

### 📋 Notion Template Processor
**Path:** `skills/notion-template-processor/`
**Purpose:** Fill Notion database templates with data and deliver via email using Notion MCP integration.
**Use When:** Automating document generation, processing client proposals, or sending templated content.

### 📄 PDF Processor
**Path:** `skills/pdf-processor/`
**Purpose:** Comprehensive PDF manipulation toolkit for extracting text and tables, creating new PDFs, merging/splitting documents, and handling forms.
**Use When:** Need to programmatically process, generate, or analyze PDF documents at scale.

### 🎥 YouTube Transcript Downloader
**Path:** `skills/youtube-transcript-downloader/`
**Purpose:** Download YouTube video transcripts using yt-dlp, with Whisper transcription fallback if no subtitles are available.
**Use When:** User provides a YouTube URL and requests transcript, captions, or subtitles.

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines on:

- Creating new skills
- Skill structure and naming conventions
- Testing requirements
- Submission process
- Best practices

### Quick Contribution Process

1. Fork the repository
2. Create a branch: `git checkout -b skill/your-skill-name`
3. Create skill in `skills/your-skill-name/`
4. Add `SKILL.md` and create ZIP file
5. Update documentation
6. Submit a Pull Request

## 📚 Documentation

- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Complete contribution guide
- **[USAGE_GUIDE.md](USAGE_GUIDE.md)** - Deployment instructions for all platforms
- **[IMPORT_GUIDE.md](IMPORT_GUIDE.md)** - Importing skills from Git repositories
- **[AUDIT_REPORT.md](AUDIT_REPORT.md)** - Repository organization audit and recommendations
- **[docs/REFERENCE.md](docs/REFERENCE.md)** - Technical reference documentation

## 🔧 Development

### Creating a New Skill

1. **Use the template:**
```bash
mkdir -p skills/my-new-skill
cp templates/SKILL.md skills/my-new-skill/SKILL.md
```

2. **Edit SKILL.md:**
   - Update YAML frontmatter (name, description, allowed-tools)
   - Write clear instructions for Claude
   - Add examples and error handling
   - Document use cases

3. **Create ZIP for Claude Desktop:**
```bash
cd skills/my-new-skill
zip -r my-new-skill-skill.zip SKILL.md
```

4. **Test your skill:**
   - Test in Claude Code by adding to `skills/` directory
   - Test in Claude Desktop by importing ZIP file
   - Verify all examples work

### Skill Best Practices

- ✅ Use descriptive, specific skill names
- ✅ Write clear "When to Use" sections
- ✅ Provide step-by-step instructions
- ✅ Include real-world examples
- ✅ Handle errors gracefully
- ✅ Request minimal tool permissions
- ✅ Test across platforms

## 🎯 Use Cases

### For Developers
- Automate document processing workflows
- Build AI agents with specialized capabilities
- Integrate skills into CI/CD pipelines
- Create custom automation tools

### For Content Creators
- Research and write articles with citations
- Download and process YouTube content
- Generate branded documents
- Organize and manage content assets

### For Businesses
- Automate invoice and receipt organization
- Process Notion templates at scale
- Maintain brand consistency across documents
- Build custom AI-powered workflows

### For AI Agent Builders
- Compose multiple skills for complex workflows
- Deploy skills via Claude SDK
- Create specialized agents for specific domains
- Build production-ready AI applications

## 🔄 Importing Skills from Other Repositories

You can import skills from other Git repositories. See [IMPORT_GUIDE.md](IMPORT_GUIDE.md) for detailed instructions.

Example: Import from obra/superpowers:
```bash
# Coming soon - skill import tooling
```

## 🏷️ Skill Labeling System

- **Technical Skills** - Core functionality (PDF processing, email automation, etc.)
- **Methodology Skills** - Process and workflow guidance (brainstorming, planning)
- **Integration Skills** - Connect with external services (Notion, Gmail)

## 📦 Distribution

### Claude Desktop ZIP Files

Each skill includes a `{skill-name}-skill.zip` file containing just the `SKILL.md`. These can be:
- Imported directly into Claude Desktop
- Shared with team members
- Distributed via internal repositories
- Published to skill marketplaces

### Claude Code Integration

Skills in the `skills/` directory are automatically available in Claude Code. Simply:
1. Place repository in your project
2. Reference skills in conversations
3. Claude automatically loads and uses them

### Claude API/SDK Integration

Load skills programmatically:
```python
# Load multiple skills
skills = []
for skill in ['pdf-processor', 'email-automation']:
    with open(f'skills/{skill}/SKILL.md') as f:
        skills.append(f.read())

# Combine in system prompt
system_prompt = "\n\n".join(skills)
```

## ⚖️ License

MIT License - Free for personal and commercial use.

See [LICENSE](LICENSE) for full terms.

## 🙏 Acknowledgments

- **obra/superpowers** - Inspiration for brainstorming and methodology skills
- **Claude AI Community** - Feedback and contributions
- **All Contributors** - Thank you for making this collection better!

## 📞 Support

- **Issues:** [GitHub Issues](https://github.com/YOUR_USERNAME/claude-skills-collection/issues)
- **Discussions:** [GitHub Discussions](https://github.com/YOUR_USERNAME/claude-skills-collection/discussions)
- **Documentation:** Check the `docs/` directory

## 🗺️ Roadmap

- [ ] Add GitHub Actions for skill validation
- [ ] Create automated skill import tooling
- [ ] Build skill marketplace/catalog
- [ ] Add more example implementations
- [ ] Create video tutorials
- [ ] Expand skill collection (20+ skills)

---

**Ready to supercharge your Claude AI workflows with organized, reusable skills!** 🚀

Built with ❤️ for the Claude AI community.
