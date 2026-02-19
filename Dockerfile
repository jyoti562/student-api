# Builder stage
FROM python:3.10-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# Runtime stage
FROM python:3.10-slim
WORKDIR /app

COPY --from=builder /usr/local /usr/local
COPY --from=builder /app /app

CMD ["python", "run.py"]
ENV FLASK_APP=run.py
