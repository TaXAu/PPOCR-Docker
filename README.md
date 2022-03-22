# ppocr-server-docker

[![](https://img.shields.io/badge/PaddleOCR-2.4.0-blue)](https://github.com/PaddlePaddle/PaddleOCR) [![](https://img.shields.io/badge/PaddlePaddle-2.2.0-blue)](https://github.com/PaddlePaddle/Paddle) [![](https://img.shields.io/badge/PaddleServing-0.8.3-blue)](https://github.com/PaddlePaddle/Serving)
[![Docker Image CI](https://github.com/TableOCR-RPA/ppocr-server-docker/actions/workflows/docker-ci.yml/badge.svg)](https://github.com/TableOCR-RPA/ppocr-server-docker/actions/workflows/docker-ci.yml) ![](https://img.shields.io/badge/support-CPU-yellow)

使用 GitHub Actions 自动构建 Docker 镜像， 参考[PPOCR 服务化部署](https://github.com/PaddlePaddle/PaddleOCR/blob/release/2.4/deploy/pdserving/README_CN.md)。

## 服务配置

- `http` 端口： 默认为 `9998`
- `rpc` 端口： 默认为 `18091`

更多可查看配置文件`PaddleOCR/deploy/pdserving/config.yml`和PaddleOCR官方文档。

## 镜像配置

- 工作目录：`/home/Projects`

## 使用方法

```shell
docker run -p 9998:9998 -p 18091:18091 sperjar/ppocr:latest
```
