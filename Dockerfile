FROM hub.deepin.com/library/python:3.8
WORKDIR /alkssh
COPY . .
RUN set -e; \
    mkdir -p /root/.pip/; \
    echo "[global]\n\
index-url = https://mirrors.huaweicloud.com/repository/pypi/simple\n\
trusted-host = mirrors.huaweicloud.com\n\
timeout = 120" > /root/.pip/pip.conf; \
    pip3.8 install -r requirements.txt
EXPOSE 8080
ENTRYPOINT ["python3.8", "manage.py", "runserver", "0.0.0.0:8080"]