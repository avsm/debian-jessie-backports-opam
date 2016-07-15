FROM debian:stable
MAINTAINER Anil Madhavapeddy <anil@recoil.org>
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install packaging-dev debian-keyring devscripts equivs
RUN echo "deb-src http://httpredir.debian.org/debian stable main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get build-dep -y ocaml-nox
RUN apt-get install -y emacs24
COPY build-dsc.sh /usr/bin/build-dsc
RUN mkdir /root/build
WORKDIR /root/build
RUN build-dsc http://http.debian.net/debian/pool/main/o/ocaml/ocaml_4.02.3-6.dsc ocaml-4.02.3
RUN build-dsc http://http.debian.net/debian/pool/main/c/camlp4/camlp4_4.02.1+3-2.dsc camlp4-4.02.1+3
RUN apt-get install -y tex-common
RUN build-dsc http://http.debian.net/debian/pool/main/h/hevea/hevea_2.28-1.dsc hevea-2.28 netpbm texlive-base
RUN build-dsc http://http.debian.net/debian/pool/main/f/findlib/findlib_1.6.2-1.dsc findlib-1.6.2
RUN build-dsc http://http.debian.net/debian/pool/main/u/uutf/uutf_0.9.4-1.dsc uutf-0.9.4
RUN build-dsc http://http.debian.net/debian/pool/main/j/jsonm/jsonm_0.9.1-1.dsc jsonm-0.9.1
RUN apt-get install -y zlib1g-dev
RUN build-dsc http://http.debian.net/debian/pool/main/c/camlzip/camlzip_1.05-3.dsc camlzip-1.05
RUN build-dsc http://http.debian.net/debian/pool/main/c/cppo/cppo_1.3.2-1.dsc cppo-1.3.2
RUN build-dsc http://http.debian.net/debian/pool/main/e/extlib/extlib_1.7.0-2.dsc extlib-1.7.0
RUN build-dsc http://http.debian.net/debian/pool/main/o/ounit/ounit_2.0.0-1.dsc ounit-2.0.0
RUN apt-get install -y tk-dev
RUN build-dsc http://http.debian.net/debian/pool/main/l/labltk/labltk_8.06.0+dfsg-3.dsc labltk-8.06.0+dfsg
RUN apt-get build-dep -y liblablgl-ocaml-dev
RUN build-dsc http://http.debian.net/debian/pool/main/l/lablgl/lablgl_1.05-2.dsc lablgl-1.05
RUN apt-get build-dep -y liblablgtk2-ocaml-dev
RUN build-dsc http://http.debian.net/debian/pool/main/l/lablgtk2/lablgtk2_2.18.3+dfsg-1.dsc lablgtk2-2.18.3+dfsg
RUN apt-get build-dep -y libocamlgraph-ocaml-dev
RUN build-dsc http://http.debian.net/debian/pool/main/o/ocamlgraph/ocamlgraph_1.8.6-1.dsc ocamlgraph-1.8.6
RUN apt-get install -y libglib2.0-dev
RUN build-dsc http://http.debian.net/debian/pool/main/c/cudf/cudf_0.7-2.dsc cudf-0.7
RUN apt-get build-dep -y libbz2-ocaml-dev
RUN build-dsc http://http.debian.net/debian/pool/main/c/camlbz2/camlbz2_0.6.0-6.dsc camlbz2-0.6.0
RUN build-dsc http://http.debian.net/debian/pool/main/o/ocaml-re/ocaml-re_1.2.2-1.dsc ocaml-re-1.2.2
RUN apt-get build-dep -y libdose3-ocaml-dev
RUN apt-get install -y aspcud
RUN build-dsc http://http.debian.net/debian/pool/main/d/dose3/dose3_5.0-1.dsc dose3-5.0
RUN build-dsc http://http.debian.net/debian/pool/main/c/cmdliner/cmdliner_0.9.8-1.dsc cmdliner-0.9.8
RUN apt-get build-dep -y opam
RUN build-dsc http://mirror.vorboss.net/debian/pool/main/o/opam/opam_1.2.2-5.dsc opam-1.2.2
RUN tar -zcvf /root/build.tgz .
RUN echo TODO: install a debian repo and copy out the debs that have been built here
