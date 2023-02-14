import os
import sys

"""
Allows for path mutability when testing. Modules can be then imported as follows:

>>> import src                 
>>> from src import my_module
"""

global_path_index: int = 0  # declare path index to insert global path
sys.path.insert(global_path_index, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

