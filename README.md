See https://www.python.org/dev/peps/pep-0382/#namespace-packages-today

```
$ PYTHONPATH=override:orig python3 -c 'import module; print(module.__path__); import module.mixin'
HI from orig.module.__init__
['/path/to/orig/module', '/path/to/override/module']
HI from module.mixin
HI from orig.module.something.py
```
