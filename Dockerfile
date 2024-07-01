FROM python:3.8


WORKDIR /usr/src/app
COPY . .

COPY requirements.txt /usr/src/app/
RUN apt-get update && apt-get install -y rsync

RUN pip install --upgrade pip


RUN pip install --no-cache-dir -r requirements.txt


COPY .env /usr/src/app/


COPY . /usr/src/app/



CMD ["sh", "-c", "python manage.py collectstatic --noinput && python manage.py migrate && python manage.py updatecatalog && python manage.py runserver 0.0.0.0:8000"]
