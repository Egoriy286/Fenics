# Используем базовый образ Fenics
FROM quay.io/fenicsproject/stable:current

# Устанавливаем рабочую директорию
WORKDIR /home/fenics/shared

# Устанавливаем Jupyter
RUN apt-get update && apt-get install -y python3-pip && \
    pip3 install jupyterlab

# Копируем текущую директорию в контейнер
COPY . /home/fenics/shared

# Указываем команды, которые будут выполняться при запуске контейнера
CMD ["bash", "-c", "jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root"]

# Открываем порт 8888
EXPOSE 8888
