# -*- coding: utf-8 -*-
"""
Modified on: 2023-02-14 11:58

@author: Joshua
"""


class Version:
    """ Applies versioning rules to a given instance or string

    If a string is formatted in the proper version, it can also be 
    used without creating an instance of Version.
    The version class is responsible for regulating these
    changes and incrementing individual versions as set by
    the following formatting conditions:

    Each version has a syntax which is applied as follows: x.y.z, see
    default keyword below. eg: major.minor.patch
    """

    def __init__(self, default: str ="0.1.0"):
        """Constructor may be called optionally through class dunder methods.

        Args:
            default (str): Starting version that will then be incremented from.

        Links:
            https://peps.python.org/pep-0008/#public-and-internal-interfaces
        """
        
        self._default: str = default

    @staticmethod
    def trisect(version: str) -> list:
        """ Return mutable components of speficied version

        Args:
            version (str): version number seperated by dots to indicate components
        """
        _version: int = version.split('.')
        return _version

    @property
    def default(self) -> str:
        """ Retrieve default version specified in constructor.

            Note:
                also used for class TestVersion(unit.TestCase)
        """
        return self._default
