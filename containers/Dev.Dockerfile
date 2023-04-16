FROM python:3.10-slim-bullseye

RUN apt update \
  && DEBIAN_FRONTEND=noninteractive apt install -y \
    net-tools \
    nano \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

ENV PYTHONPATH /var/app

WORKDIR /var/app
COPY ./requirements.txt requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt

ENTRYPOINT [ "python", "main.py" ]