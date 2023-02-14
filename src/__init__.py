import os
import sys

global_path_index: int = 0  # declare path index to insert global path
sys.path.insert(global_path_index, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
