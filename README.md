# Readers' Haven Public Library



A responsive static website for a community library, developed as part of the DevOps Fundamentals assignment.



## Project Overview



Readers' Haven provides visitors with information about library collections, membership plans, library services, and contact details.



The website is built using HTML5 and CSS3. Parcel is used for building the static website, while Docker and Nginx are used for containerized deployment.



## Technologies Used



- HTML5

- CSS3

- JavaScript

- Node.js

- npm

- Parcel

- Docker

- Nginx

- Git and GitHub



## Project Structure



```text

readers-haven-library/

├── src/

│   ├── index.html

│   ├── collections.html

│   ├── membership.html

│   ├── services.html

│   └── contact.html

├── styles/

│   └── style.css

├── Dockerfile

├── .dockerignore

├── .gitignore

├── package.json

├── package-lock.json

├── README.md

└── dist/

```



Note: Some feature pages and Docker configuration are being integrated through separate pull requests. The `dist/` directory is generated during the build process and is not committed to Git.



## Prerequisites



Install the following:



- Git

- Node.js and npm

- Docker Desktop



## Run Locally



Clone the repository:



```bash

git clone https://github.com/AbdurehmanSafi/readers-haven-library.git

cd readers-haven-library

```



Install dependencies:



```bash

npm ci

```



Build the website:



```bash

npm run build

```



The generated website will be available in the `dist/` directory.



## Docker Implementation



The project uses a multi-stage Docker build.



### Build Stage



- Uses Node.js 22 Alpine.

- Installs dependencies with `npm ci`.

- Copies the source HTML and CSS files.

- Builds the website using Parcel.



### Production Stage



- Uses Nginx 1.27 Alpine.

- Copies the generated `dist/` files into the Nginx web directory.

- Exposes port 80.

- Runs Nginx in the foreground.



This approach keeps the final production image lightweight and excludes development dependencies.



## Build Docker Image



```bash

docker image build -t readers-haven:latest .

```



## Run Docker Container



```bash

docker container run -d --name readers-haven-test -p 8085:80 readers-haven:latest

```



Open the website:



http://localhost:8085



## Verify Container



List running containers:



```bash

docker container ls

```



View logs:



```bash

docker container logs readers-haven-test

```



Inspect website files:



```bash

docker container exec readers-haven-test ls -la /usr/share/nginx/html

```



## Stop and Remove Container



```bash

docker container stop readers-haven-test

docker container rm readers-haven-test

```



## Docker Hub



Docker Hub repository:



https://hub.docker.com/r/abdurehman14/readers-haven



Tag and push an image:



```bash

docker image tag readers-haven:latest abdurehman14/readers-haven:v1

docker image push abdurehman14/readers-haven:v1

```



Pull the published image:



```bash

docker image pull abdurehman14/readers-haven:v1

```



## GitHub Workflow



- `main` is the stable branch.

- `develop` is the integration branch.

- Features are developed in separate feature branches.

- Pull requests are used to submit changes.

- Required approvals must be obtained before merging into protected branches.



## Important Notes



- This is a static website.

- The contact form is not connected to a backend.

- Parcel generates the production files in `dist/`.

- Docker uses Nginx to serve the generated website.

- Do not commit `node_modules/`, `dist/`, or sensitive credentials.

