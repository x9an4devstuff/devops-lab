# Start from a small official image that already has Python installed
FROM python:3.12-slim

# Work inside a folder called /app in the image
WORKDIR /app

# Copy the list of libraries first and install them.
# (Done before copying the code so Docker can reuse this step when only the code changes.)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Now copy the app code in
COPY app.py .

# Create a normal user and switch to it, so the app doesn't run as root (admin)
RUN useradd --create-home appuser
USER appuser

# Note that the app listens on port 5000
EXPOSE 5000

# The command that runs when a container starts
CMD ["python", "app.py"]