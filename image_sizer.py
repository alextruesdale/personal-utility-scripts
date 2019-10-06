#!/usr/bin/env python3

import os
from PIL import Image

def image_reducer(path_in, min_width=1280, min_height=1280):
    """
    Function reducing image size for a single given image.
    Default parameter values (min- max-width set to 1280px)
    """

    img = Image.open(path_in)
    maxsize = (min_width, min_height)
    original_size = os.stat(path_in).st_size >> 20

    print('>> original dimensions: ', img.size)
    print('>> original size: ', str(original_size) + ' MB', '\n')

    img.thumbnail(maxsize, Image.ANTIALIAS)
    return img, original_size

def shrink_all_images(images, output_dir):
    """Map image_reducer function to list of source images."""

    for i, img in enumerate(images):
        print(i, 'of', len(images))

        img_slug = os.path.splitext(os.path.basename(img))[0]
        img_slug_out = img_slug + '.png'
        img_path_out = os.path.join(output_dir, img_slug_out)

        img, original_size = image_reducer(img)
        img.save(img_path_out, 'png', quality=75, optimize=True)

        reduced_size = os.stat(img_path_out).st_size >> 20
        size_reduction = round((original_size - reduced_size) / original_size * 100, 2)

        print('>> reduced dimensions: ', img.size)
        print('>> reduced size: ', str(reduced_size) + ' MB', '\n')
        print(f'size reduction: {size_reduction}%', '\n')

def source_images(origin_dir, extension='.tif'):
    """OS Walk to find all images with given extension beneath origin directory."""

    os.chdir(origin_dir)

    walk_output = list(os.walk(origin_dir))
    files_in_directory = walk_output[0][2]
    root = walk_output[0][0]

    images = [os.path.join(root, file) for file in files_in_directory if file.endswith(extension)]

    return images

def main():
    """Main operator function for resizing tool."""

    origin_dir = '/Users/alextruesdale/Desktop/film/Härdle'
    output_dir = os.path.join(origin_dir, 'resized_01')

    images = source_images(origin_dir)
    shrink_all_images(images, output_dir)

if __name__ == '__main__':
    main()
