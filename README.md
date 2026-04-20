# Site-Hygiene-Agent

The **Site-Hygiene-Agent** is an autonomous framework designed to maintain the digital integrity of nonprofit organizations. Unlike traditional link-checkers, this agent executes a full investigative loop to detect, analyze, and remediate complex web presence vulnerabilities.

## The Agentic Workflow
Traditional tools stop at "Broken Link." The **Site-Hygiene-Agent** executes a deeper investigative cycle:

1.  **Observational Discovery:** Periodically crawls and monitors for non-200 status codes or cross-domain redirects.
2.  **Semantic Analysis:** Uses LLM vision and text analysis to determine if the destination content matches the organization's mission (e.g., identifying "Malicious Gambling" on a "Specific Ministry" path).
3.  **Root Cause Attribution:** Differentiates between a server-side 404, a structural structural breakage (like legacy Drupal paths), and a "Zombie Domain" (expired secondary domains).
4.  **Remediation Synthesis:** 
    *   Generates `wp-cli` or `terminus` commands for database-level search/replace.
    *   Performs web-searches for official "safe" sources of missing legacy assets.
    *   Drafts high-context alerts for site administrators.

---

## Implementation Roadmap

### Module 1: The Scout
**Discovery Layer:** Focuses on external redirects and structural consistency.
- **Implementation:** 
    - `_agents/skills/site-hygiene/scripts/audit-links.sh` (Crawl & Redirect Check)
    - `_agents/skills/site-hygiene/scripts/check-domains.sh` (WHOIS & DNS Monitoring)

### Module 2: The Auditor
**Analysis Layer:** LLM-evaluator for content-mismatch and mission-drift detection.
- **Implementation:** 
    - `_agents/skills/site-hygiene/SKILL.md` (Defines the reasoning logic for the agent to identify malicious titles and spam keywords).

### Module 3: The Librarian
**Recovery Layer:** Tooling to find and verify official resource replacements.
- **Implementation:** 
    - `_agents/skills/site-hygiene/references/site-hygiene-guide.md` (Provides the "Asset Recovery" playbook for the agent).
    - `remediation_assets/` (Local storage for recovered legacy assets).

### Module 4: The Communicator
**Reporting Layer:** Incident reporting and synthesis for stakeholders.
- **Implementation:** 
    - Agentic output of structured **Remediation Memos** (documented in `SKILL.md`).

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

### 1. Data-Based Evaluation (`tests/eval_manifest.json`)
We use a **Ground Truth Manifest** to mathematically verify the agent's performance. This ensures that the agent is measured against "Known Bad" scenarios:
- **Malicious Patterns:** Verifies that the agent correctly flags specific spam keywords (e.g., `togel`, `gambling`) in destination page titles.
- **Structural Mapping:** Verifies detection of legacy CMS paths (e.g., `/sites/default/files/`).
- **Asset Verification:** Sets the criteria for what constitutes a "Verified Domain" for asset recovery.

### 2. Evaluation Runner
Run the data-based evaluation suite to see the agent's logic verified against the manifest:
```bash
python3 tests/run_evals.py
```

---

## Agentic Safety & HITL
This agent is designed with a **Human-in-the-loop (HITL)** architecture. It synthesizes remediations—including database commands and email drafts—but requires administrative approval before execution. This ensures that automated cleanup doesn't accidentally break mission-critical legacy paths or sensitive content.

## Measuring "Hygiene IQ"
When running an evaluation, we look for the following **Data-Based Indicators**:
1. **Semantic Precision:** The agent correctly identifies the classification (e.g., "MALICIOUS") defined in the manifest.
2. **Path Awareness:** The agent correctly identifies structural patterns defined in the ground truth.
3. **Recovery Accuracy:** The agent sources replacements only from domains listed in the "Verified Domains" whitelist.

## Visualizing the Loop
The **Antigravity** orchestration follows this cycle:
- **Ingest:** Monitors live site, social headers, and search console data.
- **Reason:** Compares current site state against historical "known good" configurations and mission values.
- **Act:** Sources replacement files and drafts remediation scripts.
- **Refine:** Verifies the fix (confirming 200 OK) after the administrator executes the suggested action.

## License
MIT
