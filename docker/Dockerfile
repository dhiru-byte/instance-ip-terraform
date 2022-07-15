FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

# Expose
EXPOSE  8000

# Run
CMD ["python3", "public_ip_running_instance.py"]