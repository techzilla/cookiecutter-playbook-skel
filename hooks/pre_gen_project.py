import re
import sys

MODULE_REGEX = r'^[a-zA-Z][-a-zA-Z0-9]+$'

project_name = '{{ cookiecutter.project_name }}'


if not re.match(MODULE_REGEX, project_name):
    print('ERROR: %s is not a valid project name' % project_name)

    sys.exit(1)
