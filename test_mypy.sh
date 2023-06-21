#!/bin/bash
set -x

function doit() {
    MYPYPATH=override:orig mypy --namespace-packages -p module           -v 2>&1 | grep BuildS
    MYPYPATH=override:orig mypy --namespace-packages -p module.something -v 2>&1 | grep BuildS
    MYPYPATH=override:orig mypy --namespace-packages -p module.mixin     -v 2>&1 | grep BuildS
    MYPYPATH=override:orig mypy --namespace-packages -p module.shadow    -v 2>&1 | grep BuildS
}


git checkout -- orig/module/__init__.py
echo "With __init__.py in orig"
doit

rm -f orig/module/__init__.py
echo "Without __init__.py in orig"
doit

# OK, so basically if __init__.py is there, mypy doesn't resolve shadow correctly, in this  case we get
# LOG:  Found source:           BuildSource(path='orig/module/shadow.py', module='module.shadow', has_text=False, base_dir=None, followed=False)
#
# whereas without, as expected
# LOG:  Found source:           BuildSource(path='override/module/shadow.py', module='module.shadow', has_text=False, base_dir=None, followed=False)
