# Claude Skills Directory - Organized & Labeled

This directory contains Claude skills organized by origin and functionality.

## 🎯 **Skill Categories**

### **🔧 Technical Implementation Skills** (Local Development)
Skills that provide technical capabilities and tools:

#### **📁 Algorithmic Art Generation**
- `algorithmic-art/` - Generate algorithmic art and visualizations
- *Status*: ✅ Local-developed skill

#### **⚙️ Build & Deployment Tools**
- `artifacts-builder/` - Build and package artifacts
- *Status*: ✅ Local-developed skill

#### **🎨 Design & Branding Tools**
- `brand-guidelines/` - Brand guideline enforcement
- `canvas-design/` - Canvas-based design tools
- *Status*: ✅ Local-developed skill

#### **📄 Document Processing**
- `document-skills/` - PDF, DOCX, PPTX processing tools
- *Status*: ✅ Local-developed skill

#### **👥 Communication & Collaboration**
- `internal-comms/` - Internal communication tools
- *Status*: ✅ Local-developed skill

#### **🔧 Development Infrastructure**
- `mcp-builder/` - MCP server building tools
- `skill-creator/` - Automated skill creation system
- *Status*: ✅ Local-developed skill

#### **🎮 Creative & Interactive**
- `slack-gif-creator/` - Animated GIF creation for Slack
- *Status*: ✅ Local-developed skill

#### **🎨 Templates & Themes**
- `template-skill/` - Skill template system
- `theme-factory/` - Theme creation and management
- *Status*: ✅ Local-developed skill

#### **🌐 Web & Application Testing**
- `webapp-testing/` - Web application testing tools
- *Status*: ✅ Local-developed skill

#### **🤖 Custom Specialized Skills**
- `notion-template-processor/` - 💡 **NEW!** Notion MCP integration for template processing + email delivery
- `test-skill/` - Testing and development skill
- *Status*: ✅ Factory-generated skills

---

### **🎯 Development Methodology Skills** (Official Repository)
Skills that teach and enforce development best practices:

#### **📚 Available in obra/superpowers Repository**

| Skill | Description | Status |
|-------|-------------|---------|
| `brainstorming/` | Structured brainstorming methodology | 🔗 Available online |
| `commands/` | Command execution and management | 🔗 Available online |
| `condition-based-waiting/` | Conditional workflow management | 🔗 Available online |
| `defense-in-depth/` | Security-first development practices | 🔗 Available online |
| `dispatching-parallel-agents/` | Multi-agent workflow coordination | 🔗 Available online |
| `executing-plans/` | Plan execution and tracking | 🔗 Available online |
| `finishing-a-development-branch/` | Branch completion workflows | 🔗 Available online |
| `receiving-code-review/` | Code review receiving process | 🔗 Available online |
| `requesting-code-review/` | Code review requesting process | 🔗 Available online |
| `root-cause-tracing/` | Systematic debugging methodology | 🔗 Available online |
| `sharing-skills/` | Skill sharing and collaboration | 🔗 Available online |
| `subagent-driven-development/` | Sub-agent development patterns | 🔗 Available online |
| `systematic-debugging/` | Structured debugging approach | 🔗 Available online |
| `test-driven-development/` | TDD methodology and practices | 🔗 Available online |
| `testing-anti-patterns/` | Common testing pitfalls | 🔗 Available online |
| `testing-skills-with-subagents/` | Sub-agent testing strategies | 🔗 Available online |
| `using-git-worktrees/` | Git worktree best practices | 🔗 Available online |
| `using-superpowers/` | Superpowers framework usage | 🔗 Available online |
| `verification-before-completion/` | Pre-completion verification | 🔗 Available online |
| `writing-plans/` | Plan writing methodology | 🔗 Available online |
| `writing-skills/` | Skill writing best practices | 🔗 Available online |

**To import methodology skills:**
```bash
cd claude-code-skills-factory/scripts
python import_skill.py https://github.com/obra/superpowers.git --skill-dir brainstorming
# This would create: skills/brainstorming-official/
```

---

## 🏷️ **Skill Labeling System**

### **Local Skills** (Technical Implementation)
- ✅ **No suffix** - Core development skills
- 🔧 **Technical focus** - Code execution, file processing, APIs

### **Repository Skills** (Official Methodology)
- 📚 **"-methodology" or "-official" suffix** - Development process skills
- 🎯 **Methodology focus** - Best practices, workflows, patterns

### **Factory Skills** (Generated)
- 🚀 **"-processor", "-automation", etc. suffix** - Custom generated skills
- 🤖 **Integration focus** - MCP integrations, multi-tool workflows

---

## 📦 **ZIP Files for Claude Desktop**

**Available for import:**
- `notion-template-processor/notion-template-processor-skill.zip` - 💡 **NEW!** Complete template automation
- `test-skill/test-skill-skill.zip` - Factory-generated test skill

**Import process:**
1. Open Claude Desktop
2. Profile → Skills → Import Skill
3. Select ZIP file from skills directory

---

## 🚀 **Adding More Skills**

### **From Official Repository**
```bash
# Import methodology skills
cd claude-code-skills-factory/scripts
python import_skill.py https://github.com/obra/superpowers.git "brainstorming-methodology"
python import_skill.py https://github.com/obra/superpowers.git "test-driven-development-official"
```

### **From Other Repositories**
```bash
# Import from any public Git repository
python import_skill.py "https://github.com/user/awesome-skill.git" "awesome-skill-community"
```

### **Generate New Skills**
```bash
# Use the factory to create new skills
python init.py "My Custom Skill" "What it does"
```

---

## 📊 **Skill Registry Summary**

| Category | Count | Source | Focus |
|----------|-------|--------|-------|
| **Technical Skills** | 12 | Local Development | Code execution, tools, APIs |
| **Methodology Skills** | 21 | obra/superpowers repo | Best practices, processes |
| **Factory Skills** | 2 | Generated | Custom integrations |

**Total Skills Available**: **35** skills (12 local + 21 repository + 2 generated)

---

*This directory is organized for both immediate use in Claude Code and import to Claude Desktop. Methodology skills provide development best practices, while technical skills offer implementation capabilities.*
