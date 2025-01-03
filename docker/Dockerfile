FROM nvidia/cuda:11.6.1-devel-ubuntu20.04
LABEL authors="eric"

RUN apt-get update && \
    apt-get install -y build-essential git vim curl net-tools iputils-ping bash-completion && \
    apt-get clean

WORKDIR /workspace

RUN curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash && \
    echo "source ~/.git-completion.bash" >> ~/.bashrc

# 安装 Miniconda
RUN curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    /opt/miniconda/bin/conda clean -tipy && \
    ln -s /opt/miniconda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/miniconda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# 创建 Python 3.8 的 conda 环境
RUN /opt/miniconda/bin/conda create -n sd python=3.8 -y && \
    echo "conda activate sd" >> ~/.bashrc

COPY get-pip.py /workspace
RUN /opt/miniconda/bin/conda run -n sd python get-pip.py

COPY requirement.txt /workspace

ENTRYPOINT ["bash", "-c", "source /opt/miniconda/etc/profile.d/conda.sh && conda activate base && bash"]
