import unittest
from src.release import Version


class TestVersion(unittest.TestCase):
    version = Version()

    def test_return_type_default(self):
        """ Test return type of property is type of string """
        self.assertIsInstance(TestVersion.version.default, str)

    def test_default_pointers(self):
        """ Test default can handle version string """
        self.assertGreaterEqual(TestVersion.version.default.count('.'), 2)

    def test_default_abs(self):
        """ Test version keyword argument's within bounds """
        self.assertTrue(all([True if n else False for n in Version.trisect(TestVersion.version.default)]))


if __name__ == "__main__":
    unittest.main()
