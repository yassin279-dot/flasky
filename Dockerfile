FROM python:3.9-slim

WORKDIR /app

COPY requirements requirements
RUN pip install -r requirements/docker.txt

COPY app app
COPY migrations migrations
COPY flasky.py config.py ./

ENV FLASK_APP=flasky.py
ENV FLASK_CONFIG=development

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]