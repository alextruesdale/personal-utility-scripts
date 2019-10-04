#!/usr/bin/env python3

import os
from PIL import Image

def resize_operator():
    working_dir = '/Users/alextruesdale/Desktop/film/Härdle'
    output_dir = working_dir + '/resized/'
    os.chdir(working_dir)

    files_in_directory = list(os.walk(working_dir))[0][2]
    root = list(os.walk(working_dir))[0][0]
    images = [os.path.join(root, file) for file in files_in_directory if file.endswith('.tif')]

    for i, img in enumerate(images):
        print(i, 'of', len(images))

        img_slug = os.path.splitext(os.path.basename(img))[0]
        img_slug_out = img_slug + '.png'

        img_in = Image.open(img)
        print(img_in.format)
        print(img_in.size)
        print(str(os.stat(img).st_size >> 20) + ' MB' + '\n')

        img_path_out = os.path.join(output_dir, img_slug_out)
        maxsize = (1280, 1280)
        img_in.thumbnail(maxsize, Image.ANTIALIAS)
        img_in.save(img_path_out, 'png', quality=75, optimize=True)

if __name__ == '__main__':
    resize_operator()
