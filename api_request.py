import requests

def run():
    url = "https://jsonplaceholder.typicode.com/todos/1"
    response = requests.get(url)
    print(response.json())

if __name__ == "__main__":
    run()
