# Use an official Node.js runtime as a base image
FROM node:latest

# Set the working directory to /app
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y make python build-essential && \
    rm -rf /var/lib/apt/lists/*

# Clone the shell-bot repository
RUN git clone https://github.com/botgram/shell-bot.git && \
    cd shell-bot && \
    npm install

# Set the working directory to /app/shell-bot
WORKDIR /app/shell-bot

# Start the bot
CMD ["node", "server", "&", "node", "keep_alive.js"]
