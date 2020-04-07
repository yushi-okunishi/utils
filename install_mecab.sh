WORK_BASE="/home/ec2-user/SageMaker/mecab_installation"
mkdir ${WORK_BASE}
MECAB_ROOT="${WORK_BASE}/mecab"
cd ${WORK_BASE}

# install mecab
git clone https://github.com/taku910/mecab.git
cd ${MECAB_ROOT}/mecab
./configure --enable-utf8-only
make
make check
sudo make install

# install mecab-ipadic
cd ${MECAB_ROOT}/mecab-ipadic
./configure --with-charset=utf8
make
sudo make install

# install mecab-ipadic-NEologd
cd ${MECAB_ROOT}
git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
cd ${MECAB_ROOT}/mecab-ipadic-neologd
./bin/install-mecab-ipadic-neologd -n -y

# setting PATH for using mecab on python
sudo ln -s /usr/libexec/gcc/x86_64-amazon-linux/4.8.5/cc1plus /usr/local/bin/

# run "pip install mecab-python3" in your python env.