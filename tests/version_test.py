import os
import sys
import unittest
import src.release.Version

global_path_index: int = 0  # declare path index to insert global path
sys.path.insert(global_path_index, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))



class TestVersion(unttest.TestCase):
    self.version = Version()

    def __init__(self):
        super().__init__()

    def test_default(self):
        """ Ensure version keyword argument's within bounds """
        self.assertTrue(all([True if n else False for n in Version.trisect(self.default)]))
