#!/usr/bin/env bash

pandoc -i ./analysis.md -o ./analysis_v2.pdf --pdf-engine=xelatex
