# Use official n8n image as base
FROM n8nio/n8n:latest

# Set working directory
WORKDIR /data

# Configure for Render deployment
ENV N8N_PORT=10000 \
    N8N_HOST=0.0.0.0 \
    N8N_PROTOCOL=https \
    N8N_LOG_LEVEL=info

# Add health check for better reliability
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:10000/healthz || exit 1

# Expose Render's required port
EXPOSE 10000
