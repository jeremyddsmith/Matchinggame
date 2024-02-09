# Use the Cirrus CI Flutter image as the base image
FROM ghcr.io/cirruslabs/flutter:stable

RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget



# Set the working directory in the container
WORKDIR /app

# Copy the Flutter project files into the container
COPY . .

# Install dependencies
RUN flutter pub get
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install AWS Amplify CLI
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g @aws-amplify/cli

# Install Chrome browser for debug
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install --yes ./google-chrome-stable_current_amd64.deb

# install dart sdk
# RUN -i -t google/dart /usr/bin/dart --version

# Configure AWS Amplify CLI with headless parameters
RUN amplify configure set \
    --accessKeyId ASIARM2WH4MAKOYL4YUR \
    --secretAccessKey XIXYToET9VgaH3eYn2V1tFRsf1IYrdcXelMwE8fK \
    --profile default

# Configure Amplify for dev environment
RUN amplify init \
    --amplify-provider awscloudformation \
    --stack-name "Transformers Stack" \
    --appId $AMPLIFY_APP_ID \
    --envName dev \
    --profile default

# Build the Flutter app
RUN flutter build web

# Expose port 8080 to allow external access to the app
EXPOSE 8080

# Command to run the Flutter app
CMD ["flutter", "run", "-d", "web-server"]