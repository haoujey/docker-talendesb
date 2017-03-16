FROM kaixhin/vnc

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install -y \
		software-properties-common unzip \
                ca-certificates \
                openssh-client \
                curl

# Java installation
RUN apt-add-repository -y ppa:webupd8team/java && \
	apt-get -y update && \
	yes | apt-get install -y oracle-java8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Download Talend Open Studio for ESB
RUN curl -sS https://download-mirror2.talend.com/esb/release/V6.3.1/TOS_ESB-20161216_1026-V6.3.1.zip

# Install Talend Open Studio for ESB
ADD TOS_ESB-20161216_1026-V6.3.1.zip /opt/
RUN unzip /opt/TOS_ESB-20161216_1026-V6.3.1.zip -d /opt && \
	rm /opt/TOS_ESB-20161216_1026-V6.3.1.zip && \
	mv /opt/TOS_ESB-20161216_1026-V6.3.1 /opt/tos_esb && \
	chmod +x /opt/tos_esb/TOS_ESB-linux-gtk-x86
