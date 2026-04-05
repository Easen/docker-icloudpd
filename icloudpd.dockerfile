FROM alpine:latest
LABEL maintainer="boredazfcuk"

ARG version="1.0.0"

ENV XDG_DATA_HOME="/config" TZ="UTC" ENV="/etc/profile" config_file="/config/icloudpd.conf"

# https://github.com/icloud-photos-downloader/icloud_photos_downloader/pull/1327
ARG icloudpd_git="https://github.com/myMartek/icloud_photos_downloader"
ARG icloudpd_commit="d9c77d7891def29132b7e504b7f592de61a6880c" 
ARG build_dependencies="gcc python3-dev libc-dev libffi-dev cargo openssl-dev"
ARG app_dependencies="findutils nano nano-syntax py3-pip exiftool coreutils tzdata curl libheif imagemagick shadow jq jpeg bind-tools expect inotify-tools msmtp git"

RUN echo "$(date '+%d/%m/%Y - %H:%M:%S') | ***** Build started for boredazfcuk's docker-icloudpd *****" && \
echo "$(date '+%d/%m/%Y - %H:%M:%S') | Install requirements" && \
   apk add --no-progress --no-cache --virtual build ${build_dependencies} && \
   apk add --no-progress --no-cache ${app_dependencies} && \
   find /usr/share/nano -name '*.nanorc' -printf "include %p\n" >>/etc/nanorc && \
echo "$(date '+%d/%m/%Y - %H:%M:%S') | Install iCloudPD latest release" && \
   python -m venv /opt/icloudpd && \
   source /opt/icloudpd/bin/activate && \
   pip3 install --upgrade pip && \
   pip3 install --no-cache-dir icloudpd@git+${icloudpd_git}@${icloudpd_commit} && \
   deactivate && \
   apk del build

RUN echo "${version}" > /opt/build_version.txt
COPY --chmod=0755 *.sh /usr/local/bin/
COPY authenticate.exp /opt/authenticate.exp
COPY CONFIGURATION.md /opt
COPY profile /etc/profile

HEALTHCHECK --start-period=10s --interval=1m --timeout=10s CMD /usr/local/bin/healthcheck.sh
  
VOLUME /config

CMD ["/usr/local/bin/launcher.sh"]