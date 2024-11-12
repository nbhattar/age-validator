# Use Python 3.12.5 as base image
FROM python:3.12.5

# Install Tesseract dependencies
RUN apt-get update && \
    apt-get install -y tesseract-ocr && \
    apt-get clean

# Set the working directory in the container
WORKDIR /app

COPY ./requirements.txt /app/requirements.txt


RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt


COPY . /app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]