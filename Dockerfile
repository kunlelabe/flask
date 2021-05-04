FROM python:3.8

RUN mkdir /app

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        openssh-server \
        vim \
        curl \
        wget \
        tcptraceroute \
    && pip install --upgrade pip \
    && pip install subprocess32 \
    && pip install gunicorn \ 
    && pip install virtualenv \
    && pip install flask
    
COPY requirements.txt /app

RUN export PYTHONPATH=/usr/bin/python \
 && pip install -r requirements.txt

COPY . /app

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "runserver:app"]
