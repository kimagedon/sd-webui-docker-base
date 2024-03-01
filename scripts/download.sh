#!/bin/bash

echo "########################################"
echo "Downloading SD-WebUI & components..."
echo "########################################"

set -euxo pipefail

cd /home/runner

echo "Cloning main repository..."
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git --depth=1 --no-tags --recurse-submodules --shallow-submodules

echo "Cloning dependency repositories..."
mkdir -p /home/runner/stable-diffusion-webui/repositories
cd /home/runner/stable-diffusion-webui/repositories

git clone https://github.com/Stability-AI/stablediffusion.git stable-diffusion-stability-ai --depth=1 --no-tags --recurse-submodules --shallow-submodules
git clone https://github.com/Stability-AI/generative-models.git generative-models --depth=1 --no-tags --recurse-submodules --shallow-submodules
git clone https://github.com/CompVis/taming-transformers.git taming-transformers --depth=1 --no-tags --recurse-submodules --shallow-submodules
git clone https://github.com/crowsonkb/k-diffusion.git k-diffusion --depth=1 --no-tags --recurse-submodules --shallow-submodules
git clone https://github.com/sczhou/CodeFormer.git CodeFormer --depth=1 --no-tags --recurse-submodules --shallow-submodules
git clone https://github.com/salesforce/BLIP.git BLIP --depth=1 --no-tags --recurse-submodules --shallow-submodules

echo "Cloning extension repositories..."
mkdir -p /home/runner/stable-diffusion-webui/extensions
cd /home/runner/stable-diffusion-webui/extensions

git clone https://github.com/Mikubill/sd-webui-controlnet.git controlnet --depth=1 --no-tags --recurse-submodules --shallow-submodules
git clone https://github.com/nonnonstop/sd-webui-3d-open-pose-editor.git 3d-open-pose-editor --depth=1 --no-tags --recurse-submodules --shallow-submodules
git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser.git images-browser --depth=1 --no-tags --recurse-submodules --shallow-submodules
git clone https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git tag-autocomplete --depth=1 --no-tags --recurse-submodules --shallow-submodules
git clone https://github.com/toshiaki1729/stable-diffusion-webui-text2prompt.git text2prompt --depth=1 --no-tags --recurse-submodules --shallow-submodules
git clone https://github.com/dtlnor/stable-diffusion-webui-localization-zh_CN.git localization-zh_CN --depth=1 --no-tags --recurse-submodules --shallow-submodules

cd /home/runner/stable-diffusion-webui
aria2c --allow-overwrite=false --auto-file-renaming=false --continue=true --max-connection-per-server=5 --input-file=/home/scripts/download.txt

touch /home/runner/.sdw-download-complete
