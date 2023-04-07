# Збірка додатка
FROM node:16-bullseye AS prod

# Установіть git для клонування репозиторію
RUN apt-get update && \
    apt-get install -y git

WORKDIR /app

# Клонуйте ваш репозиторій GitHub
RUN git clone --branch dev https://github.com/UserAFK/drone-calc-front.git .

# Встановіть залежності та зібрайте ваш додаток
RUN npm ci
# RUN npm install
RUN npm run build

# Розгортання додатка
FROM nginx:stable-bullseye
COPY --from=prod /app/dist /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80