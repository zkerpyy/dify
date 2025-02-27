@echo off
conda create -n a_i python=3.12.7 -y && conda activate a_i

pip install einops timm pillow openai

conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia

pip install -U "huggingface_hub[cli]"

git clone https://github.com/microsoft/OmniParser.git && cd OmniParser

pip install -r requirements.txt

huggingface-cli download --repo-type model microsoft/OmniParser --local-dir weights --include "icon_detect/*" "icon_caption_blip2/*" "icon_caption_florence/*"

python /home/Ubuntu/OmniParser/weights/convert_safetensor_to_pt.py

python gradio_demo.py


::###jupyter notebook

conda install -c conda-forge --override-channels notebook ipywidgets jupyter notebook -y


nohup jupyter notebook --ip 0.0.0.0 --port 8888 --no-browser > jupyter.log 2>&1 &

::#结束任务：
pkill -f jupyter-notebook

::# 安装 notebook
conda install -c conda-forge --override-channels notebook -y

::# 安装 ipywidgets
conda install -c conda-forge --override-channels ipywidgets -y

::# 安装 jupyter notebook
conda install -c conda-forge --override-channels jupyter notebook -y

python3 -m pip install pyautogui

sudo apt-get install scrot

sudo apt-get install python3-tk

sudo apt-get install python3-dev
echo. & pause 