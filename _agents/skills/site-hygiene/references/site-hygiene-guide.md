# Reference: Site Hygiene Best Practices for Nonprofits

## Common Failure Modes

### 1. Legacy CMS Paths
Migrations often break internal file links.
- **Pattern:** `/sites/default/files/...`
- **Remediation:** Map these to the new media library path or implement a global 301 redirect.

### 2. Domain Squatting & Malicious Redirects
Decommissioned domains (like `example-legacy-domain.org`) are prime targets for hijacking.
- **Pattern:** 301/302 redirects to gambling/SEO spam.
- **Remediation:** Reclaim the domain if traffic is high, or update all inbound links immediately.

### 3. Header & Template Decay
Vulnerabilities are often hidden in YouTube channel headers or "About" sections that aren't updated during site migrations.

---

## Agent-Led Remediation

Using an agent (like Antigravity) allows for "deep hygiene" tasks that are difficult to automate with standard CI/CD tools.

### Asset Recovery via Web Search
When an agent finds a 404 for a critical resource (e.g., a ministry PDF):
1. The agent uses `search_web` to find the document on third-party sites or archives.
2. The agent downloads the verified document to a local `remediation_assets/` folder.
3. The agent provides the file and the target WordPress location to the administrator.

### Multi-Channel Visual Audits
Standard link checkers often miss links hidden in JavaScript-heavy or visual elements:
1. The agent uses `browser_subagent` to click through YouTube "About" tabs and channel headers.
2. The agent identifies malicious links that standard crawlers might miss.
3. The agent checks if the "destination" of a link contains suspicious keywords (e.g., "togel", "toto") to flag active hijacking.

### Autonomous Redirect Mapping
The agent can analyze a list of 404s and propose specific redirect rules based on the new site structure, significantly reducing the manual work for web admins.
