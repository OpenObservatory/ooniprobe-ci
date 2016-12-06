#!/bin/sh
set -x
OONI_TESTS_PATH=$(python -c "import ooni.tests; import os; print os.path.dirname(ooni.tests.__file__)")

ooniprobe --version
touch /var/lib/ooni/initialized
trial ${OONI_TESTS_PATH}
ooniprobe --no-collector http_header_field_manipulation

exit $?
