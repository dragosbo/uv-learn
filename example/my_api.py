from fastapi import FastAPI
app = FastAPI()
@app.get("/")
def main():
   print("Hello from FastAPI example!")
   return "Hello it is me from FastAPI example!"
if __name__ == "__main__":
   main()
