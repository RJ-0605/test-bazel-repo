FROM python:3.9-slim
WORKDIR /app
# If you have requirements.txt, uncomment the next two lines
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# Copy the app code (adjust paths to your repo layout)
COPY main.py /app/main.py
EXPOSE 5000

ENTRYPOINT ["python", "/app/main_simple.py"]
