# Вибір базового образу
FROM node:19

# Встановлення Git, SSH-клієнта та SSH-сервера
RUN apt-get update && apt-get install -y git openssh-server libsecret-1-dev nano

# Створення директорії для SSH та налаштування прав доступу
RUN mkdir -p /var/run/sshd && \
    mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh

# Копіювання SSH ключа (замініть your_ssh_key на відповідний файл)
COPY ./docker/ssh-keys/docker_ssh_key.pub /root/.ssh/authorized_keys

# Налаштування прав доступу до ключа
RUN chmod 600 /root/.ssh/authorized_keys

# Встановлення робочої директорії
WORKDIR /app

# Клонування вашого репозиторію
RUN git clone -b test-deployment https://github.com/Into-the-Fathom/fathom-vaults-subgraph.git .

# Встановлення залежностей
RUN npm install

# Видалення package.json з кешу Git та робочої директорії
RUN git rm --cached package.json #&& rm package.json

# Відкриття порту для SSH
EXPOSE 22

# Запуск SSH-сервера
CMD ["/usr/sbin/sshd", "-D"]
