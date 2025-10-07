FROM debian:bookworm-slim

# Install runtime dependencies
RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download binary
RUN wget -O cl https://github.com/Kabeers-Network/cloudstore-release/releases/download/default-backend/cl && \
    chmod +x cl

# Verify binary
RUN file cl && ldd cl || echo "Static binary"

EXPOSE ${PORT:-8080}

CMD ["./cl"]
