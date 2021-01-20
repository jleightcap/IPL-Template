# largely based on:
# https://github.com/blang/latex-docker/blob/master/Dockerfile.basic

FROM debian:stable
LABEL description="latexmk wrapper for vimtex"
MAINTAINER Jack Leightcap <jleightcap@protonmail.com>

RUN apt-get update -q \
        && apt-get install -qy build-essential wget libfontconfig1 ssh \
        && apt-get install -qy python3 python3-pip

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz; \
    mkdir /install-tl-unx; \
    tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1; \
    echo "selected_scheme scheme-basic" >> /install-tl-unx/texlive.profile; \
    /install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile; \
    rm -r /install-tl-unx; \
    rm install-tl-unx.tar.gz

ENV PATH="/usr/local/texlive/2020/bin/x86_64-linux:${PATH}"
RUN unset HISTFILE

# packages
RUN tlmgr install latexmk minted titlesec xcolor standalone \
    xkeyval currfile filehook filemod import tikz pgf mdframed etoolbox \
    zref needspace gincltex svn-prov adjustbox collectbox enumitem \
    graphbox nopageno koma-script beamer fvextra fancyvrb upquote lineno \
    catchfile xstring framed float
RUN pip3 install pygments

ENV HOME /data
WORKDIR /data
