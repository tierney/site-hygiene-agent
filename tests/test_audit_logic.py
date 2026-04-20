import subprocess
import os
import unittest

class TestSiteHygieneScripts(unittest.TestCase):
    def setUp(self):
        self.script_dir = os.path.join(os.path.dirname(__file__), "..", "_agents", "skills", "site-hygiene", "scripts")
        self.audit_script = os.path.join(self.script_dir, "audit-links.sh")
        self.check_script = os.path.join(self.script_dir, "check-domains.sh")

    def test_audit_links_help(self):
        """Test that the audit-links script shows usage when no args are provided."""
        result = subprocess.run([self.audit_script], capture_output=True, text=True)
        self.assertIn("Usage:", result.stdout)

    def test_check_domains_help(self):
        """Test that the check-domains script shows usage when no args are provided."""
        result = subprocess.run([self.check_script], capture_output=True, text=True)
        self.assertIn("Usage:", result.stdout)

    def test_malicious_detection_logic(self):
        """
        Note: This is a unit test of the shell logic concepts.
        In a full eval, the agent would execute these against a live or mocked environment.
        """
        # Example of how we might test the grep/sed logic used in the scripts
        sample_html = "<html><head><title>KIATOTO Togel Online</title></head></html>"
        is_malicious = subprocess.run(
            ["grep", "-Ei", "togel|toto|gambling"], 
            input=sample_html, 
            capture_output=True, 
            text=True
        )
        self.assertEqual(is_malicious.returncode, 0)

if __name__ == "__main__":
    unittest.main()
