FROM registry.access.redhat.com/ubi8 
RUN yum install -y \
				openssh \
				iputils \
				net-tools \
				fontconfig \
				hostname \
				unzip \
				tar \
				zip \
				wget \
				which \
				curl

ARG installerName='B2BiServer_linux-x86-64.sh'
ARG workDir="/axway"


ENV B2BI_INSTALL_DIR ${workDir}/b2biserver
ENV B2BI_INSTALLER ${installerName} 
ENV WORKDIR ${workDir}
ENV SSL_DEBUG false

COPY ${installerName} src/entrypoint src/wait-for-it src/healthcheck /usr/bin/
RUN chmod +x /usr/bin/${installerName} /usr/bin/entrypoint /usr/bin/healthcheck /usr/bin/wait-for-it 
            
RUN mkdir -p ${B2BI_INSTALL_DIR}/install

COPY --chown=0:0 Dockerfile src/b2bi_env.txt ${B2BI_INSTALL_DIR}/install/

WORKDIR ${workDir}

HEALTHCHECK --interval=1m --timeout=10s --start-period=10m CMD healthcheck

ENTRYPOINT ["entrypoint"]
CMD ["-i", "-s"]
