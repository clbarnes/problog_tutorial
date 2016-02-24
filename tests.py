import os
from problog.program import PrologString
from problog.core import ProbLog
from problog.sdd_formula import SDD

ORIGINALS_DIR = 'originals'
EDITED_DIR = 'edited'

LONG_RUNNING = []  # fill in if any are really slow


def test_pl_files():
    for tutorial_name in os.listdir(ORIGINALS_DIR):
        for filename in os.listdir(os.path.join(ORIGINALS_DIR, tutorial_name)):
            if filename.endswith('.pl'):
                if os.path.join(tutorial_name, filename) not in LONG_RUNNING:
                    yield (
                        check_results,
                        os.path.join(ORIGINALS_DIR, tutorial_name, filename),
                        os.path.join(EDITED_DIR, tutorial_name, filename)
                    )


def run_pl_file(path):
    with open(path) as f:
        s = f.read()

    return ProbLog.convert(PrologString(s), SDD).evaluate()


def check_results(original_path, edited_path):
    assert os.path.exists(original_path), 'Original file path {} does not exist'.format(original_path)
    assert os.path.exists(edited_path), 'Edited file path {} does not exist'.format(edited_path)

    original_results = run_pl_file(original_path)
    edited_results = run_pl_file(edited_path)

    assert original_results == edited_results, \
        'Result from {} does not match result from {}'.format(edited_path, original_path)
