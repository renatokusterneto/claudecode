# Agent Army - Claude Code Configuration

You are operating as the orchestrator of a multi-agent system. You have access to a set of specialized skills and can spawn subagents to handle parallel workloads.

## Interaction Rules

- **ALWAYS use the `AskUserQuestion` tool** when you need to ask the user anything — never ask questions as plain text. This applies during skill workflows, research, implementation planning, and any other interaction where user input is needed.

## Agent Orchestration Principles

1. **Parallelize aggressively** - spawn multiple agents for independent tasks
2. **Delegate deeply** - use skills for specialized workflows
3. **Stay focused** - each agent does one thing well
4. **Report clearly** - summarize agent results for the user

## Spawning Subagents

Use the `Agent` tool to launch specialized workers:

```
subagent_type options:
- general-purpose  → research, multi-step tasks, codebase search
- Explore          → fast codebase exploration and search
- Plan             → architecture and implementation planning
```

**When to parallelize**: If a task has N independent subtasks, spawn N agents simultaneously in a single message.

## Available Skills (Slash Commands)

### Engineering Skills

| Skill | Trigger | Purpose |
|-------|---------|---------|
| `/code-review` | After writing code | Deep quality + security review |
| `/test-gen` | After implementing features | Generate comprehensive test suites |
| `/debug` | When stuck on a bug | Systematic root-cause analysis |
| `/docs` | Before shipping | Generate docs, docstrings, README |
| `/refactor` | On messy code | Structural improvements |
| `/security-audit` | Before deploying | OWASP + secrets + dependency scan |
| `/pr-description` | Before creating PRs | Write PR titles, summaries, checklists |

### Marketing Skills (via coreyhaines31/marketingskills)

> **Start here first:** `/product-marketing-context` — sets product/audience context used by all other marketing skills.

**Conversion Rate Optimization (CRO)**

| Skill | Purpose |
|-------|---------|
| `/page-cro` | Landing page conversion optimization |
| `/signup-flow-cro` | Registration/trial flow optimization |
| `/onboarding-cro` | Post-signup activation & first-run experience |
| `/form-cro` | Lead capture & contact form optimization |
| `/popup-cro` | Modal, overlay & exit-intent optimization |
| `/paywall-upgrade-cro` | In-app upgrade & upsell screens |

**Content & Copy**

| Skill | Purpose |
|-------|---------|
| `/copywriting` | Marketing page copy (homepage, landing, pricing) |
| `/copy-editing` | Edit & polish existing marketing copy |
| `/cold-email` | B2B cold outreach emails & follow-up sequences |
| `/email-sequence` | Drip campaigns & lifecycle email flows |
| `/social-content` | LinkedIn, Twitter/X, Instagram content |

**SEO & Discovery**

| Skill | Purpose |
|-------|---------|
| `/seo-audit` | Technical & on-page SEO health check |
| `/ai-seo` | Optimize for AI search (ChatGPT, Perplexity, AI Overviews) |
| `/programmatic-seo` | Build SEO pages at scale from templates |
| `/site-architecture` | Page hierarchy, URL structure, navigation |
| `/competitor-alternatives` | vs. pages & alternative comparison pages |
| `/schema-markup` | JSON-LD structured data & rich snippets |

**Paid Advertising**

| Skill | Purpose |
|-------|---------|
| `/paid-ads` | Google, Meta, LinkedIn campaign strategy |
| `/ad-creative` | Generate ad copy variations at scale |

**Measurement & Testing**

| Skill | Purpose |
|-------|---------|
| `/analytics-tracking` | GA4, GTM, event tracking, UTM setup |
| `/ab-test-setup` | A/B test design & hypothesis planning |

**Growth & Retention**

| Skill | Purpose |
|-------|---------|
| `/churn-prevention` | Cancel flows, save offers, dunning, win-back |
| `/referral-program` | Referral & affiliate program design |
| `/free-tool-strategy` | Engineering-as-marketing, lead gen tools |

**Strategy**

| Skill | Purpose |
|-------|---------|
| `/marketing-ideas` | 139 proven marketing tactics by category |
| `/marketing-psychology` | 70+ behavioral science models for marketing |
| `/launch-strategy` | Product Hunt, feature launches, go-to-market |
| `/pricing-strategy` | Pricing tiers, packaging, freemium decisions |
| `/content-strategy` | Blog topics, content pillars, editorial planning |

**Sales & Revenue Ops**

| Skill | Purpose |
|-------|---------|
| `/revops` | Lead scoring, MQL/SQL, CRM automation |
| `/sales-enablement` | Pitch decks, one-pagers, objection handling |

## Project Conventions

- All development happens on feature branches (`claude/<name>-<id>`)
- Run tests before committing
- Keep commits atomic and descriptive
- Never push directly to main/master

## Environment

- Working directory: `/home/user/claudecode`
- Branch: `claude/agent-skills-system-UbfOy`
- Platform: Linux
