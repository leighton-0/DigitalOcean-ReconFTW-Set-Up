#!/usr/bin/env bash

# Show env vars
grep -v '^#' .env

# Export env vars
export $(grep -v '^#' ~/reconftw/.env | xargs)
    # export defines environmental variable
    # -v  Invert the sense of matching, to select non-matching lines
    # ^#  selects lines starting with #
