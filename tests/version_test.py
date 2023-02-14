import unittest
import src.release.Version


class TestVersion(unttest.TestCase):
    self.version = Version()

    def __init__(self):
        super().__init__()

    def test_default(self):
        """ Ensure version keyword argument's within bounds """
        self.assertTrue(all([True if n else False for n in Version.trisect(self.default)]))
