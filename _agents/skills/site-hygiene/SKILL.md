# Skill: Site Hygiene & Integrity (Agentic)

## Goal
To proactively monitor and maintain the digital integrity of a nonprofit's presence using autonomous agents. This goes beyond simple link-checking to include domain security, asset recovery, and cross-platform vulnerability audits.

## Agent Autonomy & Configuration
This skill is designed to run in an environment with the following capabilities:
- **Browser Subagents:** The agent can autonomously navigate complex DOMs (like YouTube Studio or WordPress) to audit headers and templates.
- **Web Research:** The agent can search the public web to locate replacement assets (e.g., lost PDFs) when internal links are broken.
- **Sandboxed Execution:** Scripts are executed in a controlled local environment with access to networking tools (`curl`, `dig`, `whois`).

## Triggers
- **Periodic:** Monthly health checks.
- **Post-Migration:** Verifying link integrity following structural changes.
- **Alert-Driven:** Triggered by detected domain re-registrations or malicious redirects.

## Vulnerability Patterns
- **Malicious Redirects:** Detecting when decommissioned domains redirect to gambling/spam sites.
- **Template Decay:** Identifying bad links embedded in YouTube channel headers, "About" sections, and video description templates.
- **Legacy Structural Gaps:** Finding 404s resulting from Drupal-to-WordPress path changes (e.g., `/sites/default/files/`).

## Implementation Flow
1. **Discovery:** Agent crawls the primary site and social media profiles.
2. **Analysis:** Agent identifies 404s and classifies redirects (Safe vs. Malicious).
3. **Recovery:** Agent attempts to find missing assets via web search or archives.
4. **Remediation Report:** Agent generates a memo with specific, actionable observations for the administrator.

## Supporting Tools
- `audit-links.sh`: Link integrity and malicious redirect detection.
- `check-domains.sh`: WHOIS and A-record monitoring.
- `browser_subagent`: Visual/DOM audit of social media headers and CMS settings.
