print("HI from orig.module.__init__")

# see https://www.python.org/dev/peps/pep-0382/#namespace-packages-today
from pkgutil import extend_path
__path__ = extend_path(__path__, __name__)
