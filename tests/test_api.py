import json
from app import app

def test_healthcheck():
    client = app.test_client()
    response = client.get("/health")
    assert response.status_code == 200


def test_add_student():
    client = app.test_client()
    payload = {
        "name": "Test User",
        "age": 22,
        "course": "DevOps"
    }
    response = client.post(
        "/api/v1/students",
        data=json.dumps(payload),
        content_type="application/json"
    )
    assert response.status_code == 201


def test_get_students():
    client = app.test_client()
    response = client.get("/api/v1/students")
    assert response.status_code == 200

