#/bin/bash

find . -path '*/gen/*.ads' -and -not -name 'dlx-*' -type f -delete
find . -name 'generated' -type f -delete
