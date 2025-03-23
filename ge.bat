@echo off
uv init --python 3.12 example
cd ./example
uv add ruff jupyter streamlit uvicorn fastapi
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

(
echo from fastapi import FastAPI

echo app = FastAPI^(^)

echo @app.get^("/"^)
echo def main^(^):
echo    print^("Hello from FastAPI example!"^)
echo    return "Hello it is me from FastAPI example!"

echo if __name__ == "__main__":
echo    main^(^)

) > my_api.py


call .venv/Scripts/activate
call aliases.bat
cd ..