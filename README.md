相关的文章可以参考我的博客：[从源码编译 OpenCV 并打包到 Python 的 Docker 镜像 | 阿森的知识图谱](https://www.assen.top/blog/2024-11-27-opencv)

This repo containes the Dockerfile for compiling OpenCV from source, including the OpenCV-contrib library. It's designed to create a Docker image that includes OpenCV, Python 3.11.10, and Poetry, which is particularly handy for developing Python projects that rely on OpenCV.

### Requirements

- A Bash-compatible environment such as MacOS, Linux, WSL, or Cygwin.
- A Docker environment. The script executes the `docker build` command. If you need to use a proxy, refer to section 2.1 in the article [🐳 令人头疼的 docker 代理问题，我整理了解决方法和验证方案 | 阿森的知识图谱](https://www.assen.top/blog/2024-10-12-docker-proxy) for guidance.

### Usage

To use this setup, simply clone the repo and execute the `start.sh` script, which will automatically download the OpenCV package, decompress it, and build the Docker image.

```bash
git clone git@github.com:hansenz42/docker-opencv-poetry-base.git
cd docker-compose-poetry-base
bash start.sh
```

The resulting image will be named "opencv-poetry-base". If you wish to change the tag, you can freely modify it within the `start.sh` script.

To check the built image, type:

```bash
docker images
```
[从源码编译 OpenCV 并打包到 Python 的 Docker 镜像 | 阿森的知识图谱](https://www.assen.top/blog/2024-11-27-opencv)
# Reference

- For opencv package, refer to: [opencv/opencv: Open Source Computer Vision Library](https://github.com/opencv/opencv/)
- For opencv-contrib package, refer to: [opencv/opencv_contrib: Repository for OpenCV's extra modules](https://github.com/opencv/opencv_contrib)
