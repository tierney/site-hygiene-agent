# Site-Hygiene-Agent

The **Site-Hygiene-Agent** is an autonomous framework designed to maintain the digital integrity of nonprofit organizations. Unlike traditional link-checkers, this agent executes a full investigative loop to detect, analyze, and remediate complex web presence vulnerabilities.

## The Agentic Workflow
Traditional tools stop at "Broken Link." The **Site-Hygiene-Agent** executes a deeper investigative cycle:

1.  **Observational Discovery:** Periodically crawls and monitors for non-200 status codes or cross-domain redirects.
2.  **Semantic Analysis:** Uses LLM vision and text analysis to determine if the destination content matches the organization's mission (e.g., identifying "Indonesian Gambling" on a "Men's Ministry" path).
3.  **Root Cause Attribution:** Differentiates between a server-side 404, a structural structural breakage (like legacy Drupal paths), and a "Zombie Domain" (expired secondary domains).
4.  **Remediation Synthesis:** 
    *   Generates `wp-cli` or `terminus` commands for database-level search/replace.
    *   Performs web-searches for official "safe" sources of missing legacy assets.
    *   Drafts high-context alerts for site administrators.

---

## Implementation Roadmap

### Module 1: The Scout
A Playwright-based crawler focusing on external redirects and cross-platform consistency (YouTube headers, Social Media descriptions).

### Module 2: The Auditor
An LLM-driven evaluator for content-mismatch detection. It flags when a redirected domain no longer represents the organization's values.

### Module 3: The Librarian
Specialized tooling to find, verify, and recover official resource replacements from CDNs or web archives when internal links fail.

### Module 4: The Communicator
Automated incident reporting and remediation memos designed for non-technical staff and web administrators.

---

## Case Study: Domain Squatting Incident
This framework was successfully utilized to remediate a domain-squatting attack on a nonprofit organization:
- **The Auditor:** Scanned the sitemap and detected legacy domain redirects.
- **The Threat-Intel:** Flagged the destination content as malicious/unrelated (gambling spam).
- **The Remediation Agent:** Generated search-replace commands and successfully sourced missing assets from a verified CDN after internal paths 404'd.

---

## Getting Started with Antigravity

This toolkit is designed for **Configuration-Driven Autonomy**. Instead of manually clicking through a UI, you configure the agent's parameters in the codebase, and the agent executes the investigative loop.

### 1. Point the Agent to the Skills
Add this repository to your agent's workspace. The agent will automatically discover the skills defined in:
`_agents/skills/site-hygiene/SKILL.md`

### 2. Configure Your Environment
The agent uses the following local assets to determine its scope:
- **`primary_domain`**: Set in your agent's context or a local `.env`.
- **`social_media_profiles`**: Listed in the agent's task description or config.

### 3. Run the Audit
Simply ask your agent:
> "Execute the Site Hygiene skill for [Your Domain]. Search for legacy paths and verify our YouTube header integrity."

The agent will then:
1.  **Ingest** the local scripts and references.
2.  **Reason** about the site structure.
3.  **Act** by running audits and recovering assets.
4.  **Report** via a structured remediation memo.

---

## Testing & Evaluation

The repository includes a comprehensive testing and evaluation suite to verify agent performance.

### 1. Evaluation Scenarios (`tests/eval.yaml`)
We use `eval.yaml` to define specific investigative scenarios for the agent. These are used to benchmark the agent's ability to:
- Detect legacy structural gaps.
- Identify malicious redirects.
- Perform autonomous asset recovery.

### 2. Unit Tests
Run the Python test suite to verify the logic of the supporting shell scripts:
```bash
python3 tests/test_audit_logic.py
```

---

## Agentic Safety & HITL
This agent is designed with a **Human-in-the-loop (HITL)** architecture. It synthesizes remediations—including database commands and email drafts—but requires administrative approval before execution. This ensures that automated cleanup doesn't accidentally break mission-critical legacy paths or sensitive content.

## Visualizing the Loop
The **Antigravity** orchestration follows this cycle:
- **Ingest:** Monitors live site, social headers, and search console data.
- **Reason:** Compares current site state against historical "known good" configurations and mission values.
- **Act:** Sources replacement files and drafts remediation scripts.
- **Refine:** Verifies the fix (confirming 200 OK) after the administrator executes the suggested action.

## License
MIT
