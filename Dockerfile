# Use Nvidia CUDA base image
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04 as base

# Prevents prompts from packages asking for user input during installation
ENV DEBIAN_FRONTEND=noninteractive
# Prefer binary wheels over source distributions for faster pip installations
ENV PIP_PREFER_BINARY=1
# Ensures output from python is printed immediately to the terminal without buffering
ENV PYTHONUNBUFFERED=1 

# Install Python, git and other necessary tools
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    wget

# Clean up to reduce image size
RUN apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Clone ComfyUI repository
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /comfyui

# Change working directory to ComfyUI
WORKDIR /comfyui

# Install ComfyUI dependencies
RUN pip3 install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121 \
    && pip3 install --no-cache-dir xformers==0.0.21 \
    && pip3 install -r requirements.txt

# Install runpod
RUN pip3 install runpod requests

WORKDIR /comfyui/custom_nodes

RUN git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git

RUN mkdir -p /comfyui/models/ipadater
RUN wget -O /comfyui/models/ipadater/ip-adapter_sd15.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors
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
