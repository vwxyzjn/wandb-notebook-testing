FROM ufoym/deepo

# RUN apt-get update && DEBIAN_FRONTEND="noninteractive"  apt-get install -y git make build-essential libssl-dev zlib1g-dev \
# libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
# libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
# RUN curl https://pyenv.run | bash
# RUN echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc && \
#     echo 'eval "$(pyenv init --path)"' >> ~/.bashrc && \
#     echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
# ENV PATH="/root/.pyenv/bin/:${PATH}" 
# RUN pyenv install 3.7.10
# ENV PATH "/root/.pyenv/shims/:${PATH}"

# RUN apt-get update && apt-get install -y git curl python3.7 python3-distutils libgdal-dev
# RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.7 get-pip.py
# RUN ln -s /usr/bin/python3.7 /usr/bin/python && \
#     ln -s /usr/bin/pip3 /usr/bin/pip

RUN git clone https://github.com/wandb/examples
WORKDIR /examples
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY entrypoint.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD bash
