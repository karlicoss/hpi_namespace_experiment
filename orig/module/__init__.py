print("HI from orig.module.__init__")

# see https://www.python.org/dev/peps/pep-0382/#namespace-packages-today
print("PATH BEFORE: ", __path__, __name__)
from pkgutil import extend_path
__path__ = extend_path(__path__, __name__)
__path__ = __path__[1:] + __path__[:1]
print("PATH AFTER : ", __path__, __name__)
