FROM python:3.9.19-slim-bullseye

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY  ./requirements.txt /app/requirements.txt

RUN pip3 install -r requirements.txt

COPY  . /app/

EXPOSE 8000


ENTRYPOINT ["python", "manage.py" ]
CMD [ "runserver", "0.0.0.0:8000" ]