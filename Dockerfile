FROM ubuntu:22.04
LABEL maintainer "alain <alainhe95@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update &&\ 
 apt-get install -y\ 
 python3 \ 
 python3-pip \ 
 git \ 
 curl \ 
 wget \ 
 vim \ 
 zsh \ 
 screen \ 
 odbc-postgresql \ 
 unixodbc-dev
 
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - &&\
 curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list\
 > /etc/apt/sources.list.d/mssql-release.list &&\
 apt-get update &&\
 ACCEPT_EULA=Y apt-get -y install msodbcsql17

RUN python3 -m pip install jupyter pandas matplotlib numpy snowflake-connector-python pyodbc pyarrow jupyterlab openpyxl
RUN ln -s /usr/lib/x86_64-linux-gnu/libcrypto.so.3 /usr/lib/libcrypto.so

