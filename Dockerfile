FROM public.ecr.aws/bitnami/python:3.9-prod

COPY ./requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

WORKDIR /app
COPY ./app.py ./
EXPOSE 8080
ENTRYPOINT ["gunicorn", "-b", ":8080", "app:APP"]
