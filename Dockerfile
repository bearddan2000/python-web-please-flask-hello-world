FROM thoughtmachine/please_ubuntu

WORKDIR /workspace

RUN apt update \
    && apt install -y python3-pip

RUN  git clone https://github.com/thought-machine/please.git

WORKDIR /workspace/please

RUN ./pleasew install 

RUN ln -s ~/.please/please /usr/local/bin/plz

RUN ln -s /usr/bin/pip3 /usr/bin/pip

COPY bin .

RUN pip install --target /usr/lib/python3.6 --upgrade -r requirements.txt

ENTRYPOINT ["plz"]

CMD ["run", "--cmd=\"python3 main.py\"", ":PlzApp"]