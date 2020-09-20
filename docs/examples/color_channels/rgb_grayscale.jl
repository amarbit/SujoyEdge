# ---
# title: RGB to GrayScale
# cover: assets/rgb_grayscale.gif
# ---

# This example illustrates RGB to Grayscale Conversion


using ImageCore, TestImages

rgb_image = testimage("lighthouse")

# `I = Gray.(rgb_image)` converts an RGB image to Grayscale. 

gray_image = Gray.(rgb_image)
mosaicview(rgb_image, gray_image; nrow = 1)

# Gray scale conversion form RGB follows a weighted sum of all channels, the coffecients are computed according to
# [Rec. ITU-R BT.601-7](https://www.itu.int/dms_pubrec/itu-r/rec/bt/R-REC-BT.601-7-201103-I!!PDF-E.pdf) rounding off to 3 decimal places 
# `0.299 * R + 0.587 * G + 0.114 * B`

using ImageMagick #src
ImageMagick.save("assets/rgb_grayscale.gif", cat(rgb_image, RGB.(gray_image); dims=3); fps=1) #src
