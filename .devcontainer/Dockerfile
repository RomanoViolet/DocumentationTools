FROM ubuntu:24.04

LABEL documentationdocker.version="0.2" \
  vendor="Devendra Rai, rai.devendra@yahoo.co.uk" \
  documentationdocker.release-date="2026-10-10" \
  documentationdocker.version.is-production="No"

ARG USERNAME=ubuntu

ARG asciidoctor_version=2.0.26
ARG asciidoctor_confluence_version=0.0.2
ARG asciidoctor_pdf_version=2.3.27
ARG asciidoctor_diagram_version=3.2.1
ARG asciidoctor_epub3_version=2.3.0
ARG asciidoctor_mathematical_version=0.3.0
ARG asciidoctor_revealjs_version=5.2.0
ARG plantuml_version=1.2019.13

ENV ASCIIDOCTOR_VERSION=${asciidoctor_version} \
  ASCIIDOCTOR_CONFLUENCE_VERSION=${asciidoctor_confluence_version} \
  ASCIIDOCTOR_PDF_VERSION=${asciidoctor_pdf_version} \
  ASCIIDOCTOR_DIAGRAM_VERSION=${asciidoctor_diagram_version} \
  ASCIIDOCTOR_EPUB3_VERSION=${asciidoctor_epub3_version} \
  ASCIIDOCTOR_MATHEMATICAL_VERSION=${asciidoctor_mathematical_version} \
  ASCIIDOCTOR_REVEALJS_VERSION=${asciidoctor_revealjs_version} \
  PLANTUML_VERSION=${plantuml_version} \
  LANG=en_US.UTF-8 \
  PATH="/opt/venv/bin:${PATH}"

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    bash \
    build-essential \
    ca-certificates \
    calibre \
    curl \
    findutils \
    fonts-droid-fallback \
    fonts-ipaexfont-gothic \
    fonts-liberation \
    git \
    graphviz \
    inotify-tools \
    libgdk-pixbuf-2.0-dev \
    libglib2.0-dev \
    libcairo2-dev \
    libffi-dev \
    libgmp-dev \
    libpango1.0-dev \
    libxml2-dev \
    libxslt1-dev \
    locales \
    make \
    openjdk-17-jre-headless \
    pandoc \
    pkg-config \
    bison \
    cmake \
    flex \
    python-is-python3 \
    python3 \
    python3-dev \
    python3-pip \
    python3-venv \
    ruby \
    ruby-dev \
    sudo \
    texlive-fonts-recommended \
    unzip \
  && sed -i 's/^# *en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
  && locale-gen \
  && mkdir -p /app \
  && curl -fSL "https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download" \
    -o /app/plantuml.jar \
  && gem install --no-document "asciidoctor-confluence:${ASCIIDOCTOR_CONFLUENCE_VERSION}" \
  && gem install --no-document \
    "asciidoctor:${ASCIIDOCTOR_VERSION}" \
    "asciidoctor-diagram:${ASCIIDOCTOR_DIAGRAM_VERSION}" \
    "asciidoctor-epub3:${ASCIIDOCTOR_EPUB3_VERSION}" \
    "asciidoctor-mathematical:${ASCIIDOCTOR_MATHEMATICAL_VERSION}" \
    asciimath \
    "asciidoctor-pdf:${ASCIIDOCTOR_PDF_VERSION}" \
    "asciidoctor-revealjs:${ASCIIDOCTOR_REVEALJS_VERSION}" \
    coderay \
    epubcheck:3.0.1 \
    haml \
    pygments.rb \
    rake \
    rouge \
    slim \
    thread_safe \
    tilt \
  && python3 -m venv /opt/venv \
  && /opt/venv/bin/pip install --no-cache-dir \
    actdiag \
    'blockdiag[pdf]' \
    nwdiag \
    Pygments \
    seqdiag \
  && touch "/var/mail/${USERNAME}" \
  && chown "${USERNAME}:${USERNAME}" "/var/mail/${USERNAME}" \
  && printf '%s ALL=(root) NOPASSWD:ALL\n' "${USERNAME}" > "/etc/sudoers.d/${USERNAME}" \
  && chmod 0440 "/etc/sudoers.d/${USERNAME}" \
  && chown -R "${USERNAME}:${USERNAME}" "/home/${USERNAME}" \
  && rm -rf /var/lib/apt/lists/*

ENV HOME="/home/${USERNAME}"
USER ${USERNAME}
WORKDIR /home/${USERNAME}
VOLUME /home/${USERNAME}
CMD ["/bin/bash"]
