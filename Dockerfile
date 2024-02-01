FROM archlinux/archlinux:multilib-devel-20240201.0.210909

LABEL description="Container for docker-cicd" 

ARG HOSTNAME=0.0.0.0
ENV HOSTNAME=$HOSTNAME

ARG PORT=80
ENV PORT=$PORT

# ARG NB_USER="builder"
# ARG NB_PASSWORD="builder"
# ARG NB_UID="1001"
# ARG NB_GID="100"
# RUN useradd -l -m -s /bin/bash -N -u "${NB_UID}" "${NB_USER}" -p $(openssl passwd -1 ${NB_PASSWORD})
# USER ${NB_USER}

USER root

RUN pacman-key --init && \
    pacman -Syu --noconfirm 

RUN mkdir -p /opt/app/ && \
    mkdir -p /opt/app/output/

COPY ./scripts /opt/app/
COPY ./packages /opt/app/
Run chmod -R 777 /opt/app/

RUN cd /opt/app/

RUN chmod +x /opt/app/entrypoint.sh
EXPOSE ${PORT}

ARG NB_USER="lfs"
ARG NB_PASSWORD="lfs"
ARG NB_UID="1000"
ARG NB_GID="1000"
RUN useradd -l -m -s /bin/bash -N -u "${NB_UID}" "${NB_USER}" -p $(openssl passwd -1 ${NB_PASSWORD})

# USER ${NB_USER}
ENTRYPOINT ["/opt/app/entrypoint.sh"]
