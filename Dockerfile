FROM i386/debian:buster

# change me
RUN echo "deb http://ftp2.cn.debian.org/debian buster main" > /etc/apt/sources.list
RUN apt-get update && apt-get install -y build-essential git

RUN git clone https://github.com/ksdpmx/notSPIKEfile.git /notSPIKEfile

RUN cd /notSPIKEfile/libdisasm/src/arch/i386/libdisasm && make all
RUN cd /notSPIKEfile && make all

ENV LD_LIBRARY_PATH /notSPIKEfile/libdisasm/src/arch/i386/libdisasm
WORKDIR /notSPIKEfile
ENTRYPOINT ["./notSPIKEfile"]
