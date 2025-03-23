@echo off
uv init --python 3.12 example
cd ./example
uv add ruff jupyter
uv run ruff check
uv lock
uv sync

REM generate aliases
(
echo @echo off
echo doskey uvv=uv --version
echo doskey uvj=uv run jupyter notebook
echo doskey uvr=uv run python -m ruff check . --fix
) > aliases.bat

call .venv/Scripts/activate
call aliases.bat
cd ..