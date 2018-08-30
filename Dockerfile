FROM python:3.6

RUN adduser flask

WORKDIR /home/flask

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt

COPY model model
COPY uploads uploads
COPY app.py boot.sh ./
RUN chmod +x boot.sh

ENV FLASK_APP=app.py
ENV FLASK_ENV=development

RUN chown -R flask:flask ./
USER flask

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
