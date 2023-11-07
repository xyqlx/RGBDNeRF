#!/bin/bash

# 请使用source运行

# 定义要替换的CUDA版本
new_cuda_version="11.0"

# 设置CUDA_HOME
export CUDA_HOME=/usr/local/cuda-$new_cuda_version

# 检查PATH中是否包含/usr/local/cuda-{任意版本}/bin
if [[ $PATH == *"/usr/local/cuda-"*"/bin"* ]]; then
    # 提取当前CUDA版本
    cuda_version=$(echo $PATH | grep -oP '/usr/local/cuda-\K[0-9]+\.[0-9]+')

    echo "CUDA version: $cuda_version -> $new_cuda_version"

    # 将CUDA版本替换为新版本
    new_path=$(echo $PATH | sed "s|/usr/local/cuda-$cuda_version/bin|/usr/local/cuda-$new_cuda_version/bin|")
    export PATH=$new_path
fi

# 检查LD_LIBRARY_PATH中是否包含/usr/local/cuda-{任意版本}/lib64
if [[ $LD_LIBRARY_PATH == *"/usr/local/cuda-"*"/lib64"* ]]; then
    # 提取当前CUDA版本
    cuda_version=$(echo $LD_LIBRARY_PATH | grep -oP '/usr/local/cuda-\K[0-9]+\.[0-9]+')

    # 将CUDA版本替换为新版本
    new_ld_path=$(echo $LD_LIBRARY_PATH | sed "s|/usr/local/cuda-$cuda_version/lib64|/usr/local/cuda-$new_cuda_version/lib64|")
    export LD_LIBRARY_PATH=$new_ld_path
fi
