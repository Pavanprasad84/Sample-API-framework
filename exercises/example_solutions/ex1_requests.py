import requests
from pprint import pprint


response = requests.get('http://localhost:8000/knockknock')
print(response.status_code)
print(response.text)
print("\n")

response = requests.get('http://localhost:8000/books')
print(response.status_code)
print(response.json())
print("\n")

response = requests.get('http://localhost:8000/books/8b91b84b-04e4-4496-9635-66468c2f3e41')
print(response.status_code)
pprint(response.json())
print("\n")

new_book = {
    "author": "Neil Gaiman",
    "pages": 299,
    "publisher": "W.W. Norton & Company",
    "sub_title": None,
    "title": "Norse Mythology",
    "year": 2017
}
response = requests.post('http://localhost:8000/books', json=new_book)
print(response.status_code)
print(response.json())
print("\n")

response = requests.post('http://localhost:8000/token/alice')
print(response.status_code)
print(response.json())
print("\n")
