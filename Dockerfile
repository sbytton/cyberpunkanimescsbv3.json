# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui-post-processing-nodes@1.0.1 --mode remote
RUN comfy node install --exit-on-fail comfyui-marigold@1.0.1
RUN comfy node install --exit-on-fail ComfyUI-QualityOfLifeSuit_Omar92
RUN comfy node install --exit-on-fail was-ns@3.0.1
RUN comfy node install --exit-on-fail sdxl_prompt_styler

# download models into comfyui
RUN comfy model download --url "https://storage.googleapis.com/modelscsb/controlnetxlCNXL_2vxpswa7AnytestV4.safetensors" --relative-path models/controlnet --filename "controlnetxlCNXL_2vxpswa7AnytestV4.safetensors"
RUN comfy model download --url "https://storage.googleapis.com/modelscsb/Cyberpunk_Anime_V2_light_version-SDXL.safetensors" --relative-path models/loras --filename "Cyberpunk_Anime_V2_light_version-SDXL.safetensors"
RUN comfy model download --url "https://storage.googleapis.com/modelscsb/sdxlHK_v095c.safetensors" --relative-path models/checkpoints --filename "sdxlHK_v095c.safetensors"
# RUN # Could not find URL for sdxlHK_v095c.safetensors
# RUN # Could not find URL for Cyberpunk_Anime_V2_light_version-SDXL.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
