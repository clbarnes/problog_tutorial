import os
from problog.program import PrologString
from problog.core import ProbLog
from problog.sdd_formula import SDD

ORIGINALS_DIR = 'originals'
EDITED_DIR = 'edited'

LONG_RUNNING = []  # fill in if any are really slow

TOLERANCE = 0.001


def generate_pl_files():
    for tutorial_name in os.listdir(ORIGINALS_DIR):
        for filename in os.listdir(os.path.join(ORIGINALS_DIR, tutorial_name)):
            if filename.endswith('.pl') and os.path.join(tutorial_name, filename) not in LONG_RUNNING:
                yield (
                    os.path.join(ORIGINALS_DIR, tutorial_name, filename),
                    os.path.join(EDITED_DIR, tutorial_name, filename)
                )


def pl_str2result(s):
    return {str(key): value for key, value in ProbLog.convert(PrologString(s), SDD).evaluate().items()}


def is_close(a, b):
    return abs(a-b) < TOLERANCE


def test_problog_works():
    test_str = '0.5::heads. query(heads).'
    assert is_close(pl_str2result(test_str)['heads'], 0.5)


def test_exist():
    for original_path, edited_path in generate_pl_files():
        yield check_exists, original_path, edited_path


def test_edited():
    for original_path, edited_path in generate_pl_files():
        yield check_edited, original_path, edited_path


def test_same_results():
    for original_path, edited_path in generate_pl_files():
        yield check_results, original_path, edited_path


def run_pl_file(path):
    with open(path) as f:
        s = f.read()

    return pl_str2result(s)


def check_exists(original_path, edited_path):
    assert os.path.exists(original_path), 'Original file path {} does not exist'.format(original_path)
    assert os.path.exists(edited_path), 'Edited file path {} does not exist'.format(edited_path)


def check_edited(original_path, edited_path):
    strings = []

    for path in [original_path, edited_path]:
        with open(path) as f:
            strings.append(f.read())

    assert strings[0] != strings[1], 'File {} has not been edited'.format(edited_path)


def check_results(original_path, edited_path):
    original_results = run_pl_file(original_path)
    edited_results = run_pl_file(edited_path)

    assert original_results == edited_results, \
        'Result from {} does not match result from {}'.format(edited_path, original_path)
