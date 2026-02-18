import json
import pytest
from app import create_app
from app.extensions import db


@pytest.fixture
def app():
    """
    Create a new app instance for each test
    """
    app = create_app()

    app.config.update({
        "TESTING": True,
        "SQLALCHEMY_DATABASE_URI": "sqlite:///:memory:"  # isolated DB
    })

    with app.app_context():
        db.create_all()
        yield app
        db.drop_all()


@pytest.fixture
def client(app):
    return app.test_client()


def test_healthcheck(client):
    response = client.get("/api/v1/health")
    assert response.status_code == 200


def test_add_student(client):
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
    assert response.json["name"] == "Test User"


def test_get_students(client):
    response = client.get("/api/v1/health")
    assert response.status_code == 200
