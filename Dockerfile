# 使用最新官方镜像
FROM continuumio/miniconda3:latest

# 配置国内源加速
RUN conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main && \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r && \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2 && \
    conda config --set show_channel_urls yes

# 设置工作目录
WORKDIR /app
COPY environment.yml .

# 安装生物信息工具链
RUN conda env create -f environment.yml && \
    conda clean -a --yes

# 设置环境路径
ENV PATH="/opt/conda/envs/linux-project/bin:$PATH"

CMD ["snakemake", "--cores", "2"]