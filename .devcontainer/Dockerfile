FROM alpine:3.9
#
# PlantUML docker from: https://github.com/miy4/docker-plantuml/blob/master/Dockerfile
# ASCIIDoctor docker from: https://github.com/asciidoctor/docker-asciidoctor
#

#LABEL MAINTAINERS="Guillaume Scheibel <guillaume.scheibel@gmail.com>, Damien DUPORTAL <damien.duportal@gmail.com>"

LABEL documentationdocker.version="0.1-beta"
LABEL vendor="Devendra Rai, rai.devendra@yahoo.co.uk"
LABEL documentationdocker.release-date="2020-30-03"
LABEL documentationdocker.version.is-production="No"

ARG USERNAME=dockeruser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ARG asciidoctor_version=2.0.10
ARG asciidoctor_confluence_version=0.0.2
ARG asciidoctor_pdf_version=1.5.0.alpha.18
ARG asciidoctor_diagram_version=1.5.18
ARG asciidoctor_epub3_version=1.5.0.alpha.9
ARG asciidoctor_mathematical_version=0.3.0
ARG asciidoctor_revealjs_version=2.0.0

ENV ASCIIDOCTOR_VERSION=${asciidoctor_version} \
  ASCIIDOCTOR_CONFLUENCE_VERSION=${asciidoctor_confluence_version} \
  ASCIIDOCTOR_PDF_VERSION=${asciidoctor_pdf_version} \
  ASCIIDOCTOR_DIAGRAM_VERSION=${asciidoctor_diagram_version} \
  ASCIIDOCTOR_EPUB3_VERSION=${asciidoctor_epub3_version} \
  ASCIIDOCTOR_MATHEMATICAL_VERSION=${asciidoctor_mathematical_version} \
  ASCIIDOCTOR_REVEALJS_VERSION=${asciidoctor_revealjs_version} \
  PLANTUML_VERSION=1.2019.13 \
  LANG=en_US.UTF-8

# Installing package required for the runtime of
# any of the asciidoctor-* functionnalities
RUN apk add --no-cache \
  bash \
  curl \
  ca-certificates \
  findutils \
  font-bakoma-ttf \
  graphviz \
  inotify-tools \
  make \
  openjdk8-jre \
  py2-pillow \
  py-setuptools \
  python2 \
  ruby \
  ruby-mathematical \
  ttf-liberation \
  unzip \
  which \
  git \
  graphviz ttf-droid ttf-droid-nonlatin \
  &&  apk add --no-cache \
  --repository https://nl.alpinelinux.org/alpine/edge/testing \
  font-ipa \
  &&  mkdir /app \
  &&  curl -L https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o /app/plantuml.jar \
  #
  # Installing Ruby Gems needed in the image
  # including asciidoctor itself
  &&  apk add --no-cache --virtual .rubymakedepends \
  build-base \
  libxml2-dev \
  ruby-dev \
  && gem install --no-document \
  "asciidoctor:${ASCIIDOCTOR_VERSION}" \
  "asciidoctor-confluence:${ASCIIDOCTOR_CONFLUENCE_VERSION}" \
  "asciidoctor-diagram:${ASCIIDOCTOR_DIAGRAM_VERSION}" \
  "asciidoctor-epub3:${ASCIIDOCTOR_EPUB3_VERSION}" \
  "asciidoctor-mathematical:${ASCIIDOCTOR_MATHEMATICAL_VERSION}" \
  asciimath \
  "asciidoctor-pdf:${ASCIIDOCTOR_PDF_VERSION}" \
  "asciidoctor-revealjs:${ASCIIDOCTOR_REVEALJS_VERSION}" \
  coderay \
  epubcheck:3.0.1 \
  haml \
  kindlegen:3.0.3 \
  pygments.rb \
  rake \
  rouge \
  slim \
  thread_safe \
  tilt \
  && apk del -r --no-cache .rubymakedepends curl \
  #
  # Installing Python dependencies for additional
  # functionnalities as diagrams or syntax highligthing
  &&  apk add --no-cache --virtual .pythonmakedepends \
  build-base \
  python2-dev \
  py2-pip \
  && pip install --upgrade pip \
  && pip install --no-cache-dir \
  actdiag \
  'blockdiag[pdf]' \
  nwdiag \
  Pygments \
  seqdiag \
  && apk del -r --no-cache .pythonmakedepends \
  #
  # Add non-admin user
  &&  addgroup --g $USER_GID -S $USERNAME && \
  adduser --disabled-password \
  -s /bin/bash \
  -u $USER_UID \
  --home "/home/$USERNAME" \
  -S $USERNAME \
  -G $USERNAME && \
  echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers && \
  chmod 0440 /etc/sudoers

WORKDIR /home/$USERNAME
VOLUME /home/$USERNAME
CMD ["/bin/bash"]
