FROM python:3.8

RUN mkdir /app

WORKDIR /app

COPY requirements.txt /app

RUN export PYTHONPATH=/usr/bin/python \
 && pip install -r requirements.txt

COPY . /app

EXPOSE 8080

CMD ["python", "runserver.py", "db.py", "test.py"]
