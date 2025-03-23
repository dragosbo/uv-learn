@echo off
uv init --python 3.12 example
cd ./example
uv add ruff jupyter streamlit
uv run ruff check
uv lock
uv sync

REM generate aliases
(
echo @echo off
echo doskey uvv=uv --version
echo doskey uvj=uv run jupyter notebook
echo doskey uvr=uv run python -m ruff check . --fix
echo doskey uvs=uv run -- streamlit run .\example\app.py

) > aliases.bat

(
echo import streamlit as st
echo st.write^("hello world from Streamlit"^)
) > app.py

call .venv/Scripts/activate
call aliases.bat
cd ..