FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y pkg-config libzmq3-dev \ 
    libprotobuf-dev libprotoc-dev \
    protobuf-compiler libgmp3-dev g++ z3 boolector cmake \
    libstdc++-4.9-dev autoconf llvm-3.9-dev ocaml ocaml-native-compilers \
    camlp4 camlp4-extra opam git libssl-dev vim aspcud m4 flex bison

RUN opam init -a -y
RUN opam update
RUN opam install utop ocp-indent ocamlgraph ocamlfind zarith zmq piqi menhir llvm=3.9

RUN wget http://binsec.gforge.inria.fr/distrib/binsec-0.1-20170301.tgz
RUN tar xvf binsec-0.1-20170301.tgz
RUN ln -s binsec-0.1-20170303 binsec
RUN . /root/.opam/opam-init/init.sh && cd binsec && ./configure && make -j8 binsec

CMD ["/binsec/src/binsec", "serve", "-w", "1"]
EXPOSE 5570
