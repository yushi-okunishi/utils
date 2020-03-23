"""
--p で指定したフォルダ内にある画像をjpgに変換する
"""

import cv2
import os
import argparse
from glob import glob
from tqdm import tqdm

parser = argparse.ArgumentParser()
parser.add_argument('--p', type=str, help='folder path that includes images.')
args = parser.parse_args()

assert args.p, 'need path that includes images.'

pathes = glob(os.path.join(args.p, '*'))

for p in tqdm(pathes):
    name = p.split("/")[-1].split('.')[0]
    ext = p.split("/")[-1].split(".")[-1]
    if ext == 'jpg':
        continue
    image = cv2.imread(p)
    if image is None:
        continue
    cv2.imwrite(os.path.join(args.p, name+'.jpg'), image)
    
