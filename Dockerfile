FROM python:alpine

WORKDIR /app

RUN apk add uvicorn

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["uvicorn", "--host", "0.0.0.0", "--port", "8000", "django_devops.asgi:application"]