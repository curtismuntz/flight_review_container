FROM ubuntu:16.04
LABEL maintainer="me@murt.is"

RUN apt-get update && apt-get -y upgrade
RUN apt-get update && apt-get install -y python3-pip python python3 sqlite3 git libsqlite3-dev libfftw3-dev
RUN pip3 install --upgrade pip wheel setuptools numpy
RUN git clone https://github.com/PX4/flight_review.git /flight_review
RUN cd /flight_review && pip3 install -r requirements.txt
RUN mkdir -p /flight_review/data/log_files
RUN /usr/bin/python3.5 /flight_review/setup_db.py
EXPOSE 8888
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
