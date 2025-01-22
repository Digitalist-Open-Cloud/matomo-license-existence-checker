# Copies your code file from your action repository to the filesystem path `/` of the container
FROM alpine:latest
# Create and prepare the /repo directory
RUN mkdir /repo
COPY . /repo
# Add entrypoint script and ensure it's executable
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# Install jq (required for JSON processing)
RUN apk add --no-cache jq
# Set the entry point for the container
ENTRYPOINT ["/entrypoint.sh"]
