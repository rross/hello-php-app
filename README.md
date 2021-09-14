# Example PHP App
Example PHP app that displays hello world and phpinfo()

## Prerequisites
1. Install [gcloud](https://cloud.google.com/sdk/docs/install)
1. Install [docker](https://docs.docker.com/get-docker/)


This requires you to run through the following steps to upload the image:

- export PROJECT_ID="$(gcloud config get-value project -q)"
- docker build -t gcr.io/${PROJECT_ID}/hello-app-php:v1 .

Verify that the image has been built using:

- docker images

Upload the container image to the Google Container Registry

- gcloud auth configure-docker

And use docker to push the image to GCR

- docker push gcr.io/${PROJECT_ID}/hello-app-php:v1

- docker run --rm -p 8080:80 gcr.io/${PROJECT_ID}/hello-app-php:v1

View the output using Curl or a Browser (http://localhost:8080)

- curl http://localhost:8080

You should see something similar to this:

    Hello, world! 
    along with a bunch of informaton from php_info();

