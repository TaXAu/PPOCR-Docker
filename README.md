# ppocr-server-docker

使用 GitHub Actions 自动构建 Docker 镜像。参考[PPOCR 服务化部署](https://github.com/PaddlePaddle/PaddleOCR/blob/release/2.4/deploy/pdserving/README_CN.md)

## 服务配置

- `http` 端口： 默认为 `9998`
- `rpc` 端口： 默认为 `18091`

## 镜像配置

- 工作目录：`/home/Projects`