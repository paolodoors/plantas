#!/bin/sh
source venv/bin/activate

exec venv/bin/flask run --host 0.0.0.0
