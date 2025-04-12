conda create --name ietrans python=3.8 -y

conda activate ietrans
pip install torch==1.11.0+cu113 torchvision==0.12.0+cu113 torchaudio==0.11.0 --extra-index-url https://download.pytorch.org/whl/cu113

conda install ipython scipy h5py -y
pip install ninja yacs cython matplotlib tqdm opencv-python overrides

export INSTALL_DIR=$PWD

cd $INSTALL_DIR
git clone https://github.com/cocodataset/cocoapi.git
cd cocoapi/PythonAPI
python setup.py build_ext install

cd $INSTALL_DIR
git clone https://github.com/NVIDIA/apex.git
cd apex
git branch -r
git checkout origin/22.02-parallel-state
python setup.py install --cuda_ext --cpp_ext

python setup.py build develop

apt install ffmpeg libsm6 libxext6 libgl1-mesa-glx -y
pip install ipdb

unset $INSTALL_DI[[R