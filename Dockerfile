# Use Nvidia CUDA base image
FROM renderer/comfy-runpod-docker:1.0.0 as base

# Prevents prompts from packages asking for user input during installation
ENV DEBIAN_FRONTEND=noninteractive
# Prefer binary wheels over source distributions for faster pip installations
ENV PIP_PREFER_BINARY=1
# Ensures output from python is printed immediately to the terminal without buffering
ENV PYTHONUNBUFFERED=1

WORKDIR /comfyui/custom_nodes

RUN git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git

RUN wget -O /comfyui/custom_nodes/ComfyUI_IPAdapter_plus/models/ip-adapter_sd15.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors
RUN mkdir -p /comfyui/models/clip_vision
RUN wget -O /comfyui/models/clip_vision/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors

RUN git clone https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet.git
RUN cd ComfyUI-Advanced-ControlNet && pip3 install -r requirements.txt && cd ..

RUN mkdir -p /comfyui/models/controlnet
RUN wget -O /comfyui/models/controlnet/control_v11f1p_sd15_depth_fp16.safetensors https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11f1p_sd15_depth_fp16.safetensors

RUN git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git
RUN cd comfyui_controlnet_aux && pip3 install -r requirements.txt && cd ..

RUN git clone https://github.com/kijai/ComfyUI-KJNodes.git
RUN cd ComfyUI-KJNodes && pip3 install -r requirements.txt && cd ..

RUN git clone https://github.com/storyicon/comfyui_segment_anything.git
RUN cd comfyui_segment_anything && pip3 install -r requirements.txt && cd ..

RUN mkdir -p /comfyui/models/grounding-dino
RUN wget -O /comfyui/models/grounding-dino/GroundingDINO_SwinT_OGC.cfg.py https://huggingface.co/ShilongLiu/GroundingDINO/resolve/main/GroundingDINO_SwinT_OGC.cfg.py
RUN wget -O /comfyui/models/grounding-dino/groundingdino_swint_ogc.pth https://huggingface.co/ShilongLiu/GroundingDINO/resolve/main/groundingdino_swint_ogc.pth

RUN mkdir -p /comfyui/models/sams
RUN wget -O /comfyui/models/sams/sam_hq_vit_h.pth https://huggingface.co/lkeab/hq-sam/resolve/main/sam_hq_vit_h.pth

RUN mkdir -p /comfyui/models/bert-base-uncased
RUN wget -O /comfyui/models/bert-base-uncased/config.json https://huggingface.co/google-bert/bert-base-uncased/resolve/main/config.json
RUN wget -O /comfyui/models/bert-base-uncased/vocab.txt https://huggingface.co/google-bert/bert-base-uncased/resolve/main/vocab.txt
RUN wget -O /comfyui/models/bert-base-uncased/tokenizer.json https://huggingface.co/google-bert/bert-base-uncased/resolve/main/tokenizer.json
RUN wget -O /comfyui/models/bert-base-uncased/model.safetensors https://huggingface.co/google-bert/bert-base-uncased/resolve/main/model.safetensors

RUN wget -O /root/.cache/torch/hub/checkpoints/mobilenet_v2-b0353104.pth https://download.pytorch.org/models/mobilenet_v2-b0353104.pth

RUN mkdir -p /comfyui/custom_nodes/comfyui_controlnet_aux/ckpts/lllyasviel/Annotators/
RUN wget -O /comfyui/custom_nodes/comfyui_controlnet_aux/ckpts/lllyasviel/Annotators/dpt_hybrid-midas-501f0c75.pt https://huggingface.co/lllyasviel/ControlNet/resolve/main/annotator/ckpts/dpt_hybrid-midas-501f0c75.pt

# Download checkpoints/vae/LoRA to include in image
RUN --mount=type=secret,id=CIVITAI_TOKEN \
    wget -O /comfyui/models/checkpoints/pixelmix_v20.safetensors https://civitai.com/api/download/models/339641?token=$(cat /run/secrets/CIVITAI_TOKEN)

# Example for adding specific models into image
# ADD models/checkpoints/sd_xl_base_1.0.safetensors models/checkpoints/
# ADD models/vae/sdxl_vae.safetensors models/vae/

# Go back to the root
WORKDIR /

# Add the start and the handler
ADD src/start.sh src/rp_handler.py test_input.json ./
RUN chmod +x /start.sh

# Start the container
CMD /start.sh
