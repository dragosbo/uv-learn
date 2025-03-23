@echo off
doskey uvv=uv --version
doskey uvj=uv run jupyter notebook
doskey uvr=uv run python -m ruff check . --fix
