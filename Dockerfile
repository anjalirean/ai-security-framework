FROM python:3.11-slim

LABEL maintainer="Anjali Gopinadhan Nair <anjalignair02@gmail.com>"
LABEL description="AI Security Framework - Isolated testing environment"

WORKDIR /framework

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy framework files
COPY . .

# Create results directory
RUN mkdir -p /framework/results

# Set environment variables
ENV ISOLATED_ENVIRONMENT=true
ENV OUTPUT_PATH=/framework/results

ENTRYPOINT ["python3"]
CMD ["--help"]
