# 使用基础镜像
FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-devel

# 时区和语言，本例中没什么用
ENV TZ=Asia/Shanghai \
    LANG="en_US.UTF-8"

# 删掉过时的key
RUN apt-key del 7fa2af80 && \
    apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub && \
    apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/7fa2af80.pub

# 安装项目依赖
RUN apt-get update && apt-get install -y \
    git \
    libglib2.0-0 \
    libsm6 libxrender1 libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*

# 复制requirements.txt到容器内
COPY requirements.txt /tmp/requirements.txt

# 安装 Python 依赖
RUN pip install -r /tmp/requirements.txt

ENTRYPOINT bash
