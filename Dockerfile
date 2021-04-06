from alpine:latest

RUN apk add --no-cache python3-dev \
&& pip install --upgrade pip pipi

RUN pip3 install --upgrade pip==20.0.1
RUN pip --no-cache-dir install -r requirements.txt

WORKDIR /app

Copy . /app

EXPOSE 8080

CMD ["python","runserver.py","db.py","test.py"]
