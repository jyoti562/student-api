from flask import Blueprint, jsonify, request
from .models import Student
from .extensions import db
import socket

bp = Blueprint("api", __name__, url_prefix="/api/v1")


@bp.route("/health")
def health():
    return {
        "status": "ok",
        "served_by": socket.gethostname()
    }, 200


@bp.route("/students", methods=["GET"])
def get_students():
    students = Student.query.all()
    return jsonify([
        {
            "id": s.id,
            "name": s.name,
            "age": s.age,
            "course": s.course
        } for s in students
    ]), 200


@bp.route("/students", methods=["POST"])
def add_student():
    data = request.get_json()
    student = Student(
        name=data["name"],
        age=data["age"],
        course=data["course"]
    )
    db.session.add(student)
    db.session.commit()
    return jsonify({
        "id": student.id,
        "name": student.name,
        "age": student.age,
        "course": student.course
    }), 201
