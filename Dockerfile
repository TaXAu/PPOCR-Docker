FROM python:3.8-slim
RUN apt update && apt install -y wget git gcc ffmpeg libsm6 libxext6
RUN mkdir /home/Projects && cd /home/Projects  \
    && pip3 install --upgrade pip \
    && python3 -m pip install paddlepaddle==2.2.0 \
    && git clone https://github.com/PaddlePaddle/PaddleOCR && cd PaddleOCR \
    && pip3 install -r requirements.txt \
    && cd /tmp \
    && wget https://paddle-serving.bj.bcebos.com/test-dev/whl/paddle_serving_server_gpu-0.8.3.post102-py3-none-any.whl \
    && pip3 install paddle_serving_server_gpu-0.8.3.post102-py3-none-any.whl \

    && pip3 install paddle-serving-client==0.8.3 \
    && pip3 install paddle-serving-app==0.8.3 \

    # && wget https://paddle-serving.bj.bcebos.com/test-dev/whl/paddle_serving_client-0.7.0-cp37-none-any.whl \
    # && pip3 install paddle_serving_client-0.7.0-cp37-none-any.whl \
    # && wget https://paddle-serving.bj.bcebos.com/test-dev/whl/paddle_serving_app-0.7.0-py3-none-any.whl \
    # && pip3 install paddle_serving_app-0.7.0-py3-none-any.whl \
    
    && wget https://paddleocr.bj.bcebos.com/PP-OCRv2/chinese/ch_PP-OCRv2_det_infer.tar -O ch_PP-OCRv2_det_infer.tar && tar -xf ch_PP-OCRv2_det_infer.tar \
    && wget https://paddleocr.bj.bcebos.com/PP-OCRv2/chinese/ch_PP-OCRv2_rec_infer.tar -O ch_PP-OCRv2_rec_infer.tar &&  tar -xf ch_PP-OCRv2_rec_infer.tar \
    && python3 -m paddle_serving_client.convert --dirname ./ch_PP-OCRv2_det_infer/ \
                                         --model_filename inference.pdmodel          \
                                         --params_filename inference.pdiparams       \
                                         --serving_server /home/Projects/PaddleOCR/deploy/pdserving/ppocrv2_det_serving/ \
                                         --serving_client /home/Projects/PaddleOCR/deploy/pdserving/ppocrv2_det_client/ \
    && python3 -m paddle_serving_client.convert --dirname ./ch_PP-OCRv2_rec_infer/ \
                                         --model_filename inference.pdmodel          \
                                         --params_filename inference.pdiparams       \
                                         --serving_server /home/Projects/PaddleOCR/deploy/pdserving/ppocrv2_rec_serving/  \
                                         --serving_client /home/Projects/PaddleOCR/deploy/pdserving/ppocrv2_rec_client/ \
    && rm -rf /tmp/*
WORKDIR /home/Projects/PaddleOCR/deploy/pdserving
EXPOSE 9998 18091
CMD ["python3", "web_service.py"]

