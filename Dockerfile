FROM python:3.14-rc-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y fuse libfuse2 libfuse-dev && \
    rm -rf /var/lib/apt/lists/*

COPY calibre_to_abs_bridge.py .
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["python3", "calibre_to_abs_bridge.py"]
