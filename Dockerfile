FROM python:3.11.4-alpine

WORKDIR /usr/src/app

# Prevent Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE 1

# Ensure Python output is sent directly to the terminal without buffering
ENV PYTHONUNBUFFERED 1

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Copy the requirements.txt file into the working directory
COPY requirements.txt ./

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the entrypoint script and give it execute permissions
RUN ls -la
COPY ./entrypoint.sh ./
RUN chmod +x entrypoint.sh

# Copy the rest of the application code into the container
COPY . .

# Set the entrypoint
ENTRYPOINT ["./entrypoint.sh"]
