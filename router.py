from flask import Flask, redirect
import requests

app = Flask(__name__)

@app.route('/')
def route_to_active():
    with open('traffic_flag.txt', 'r') as f:
        flag = f.read().strip()
    port = '5000' if flag == 'blue' else '5001'
    r = requests.get(f'http://localhost:{port}')
    return r.text

if __name__ == '__main__':
    app.run(port=8080)
