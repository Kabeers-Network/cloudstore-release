FROM alpine:latest

# Install runtime dependencies
RUN apk add --no-cache ca-certificates wget

# Set working directory
WORKDIR /app

# Download the pre-built binary
RUN wget -O cl https://github.com/Kabeers-Network/cloudstore-release/releases/download/default-backend/cl && \
    chmod +x cl

# Expose port (Render binds to PORT env var)
EXPOSE ${PORT:-8080}

# Run the binary
CMD ["./cl"]
