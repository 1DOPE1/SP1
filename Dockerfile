FROM ubuntu:22.04
LABEL description="by Butko Danil"
COPY . /var2
WORKDIR /var2
RUN chmod +x /var2/test.sh
RUN apt-get update
RUN apt-get -y install genisoimage
CMD ["/var2/test.sh"]

