import os
import sys
import unittest

global_path_index: int = 0  # declare path index to insert global path
sys.path.insert(global_path_index, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from src.release import Version


class TestVersion(unittest.TestCase):
    version = Version()

    def test_default_pointers(self):
        """ Test default can handle version string """
        self.assertGreaterEqual(TestVersion.version.default.count('.'), 2)

    def test_default_abs(self):
        """ Test version keyword argument's within bounds """
        self.assertTrue(all([True if n else False for n in Version.trisect(TestVersion.version.default)]))

if __name__ == "__main__":
    unittest.main()
