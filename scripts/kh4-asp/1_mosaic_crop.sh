# ### mosaic
# image_mosaic data/KH-4/DS1105-2248DF076/DS1105-2248DF076_d.tif \
#               data/KH-4/DS1105-2248DF076/DS1105-2248DF076_c.tif \
#               data/KH-4/DS1105-2248DF076/DS1105-2248DF076_b.tif  \
#               data/KH-4/DS1105-2248DF076/DS1105-2248DF076_a.tif           \
#               -o data/KH-4/DS1105-2248DF076/DS1105-2248DF076.tif                                  \
#               --ot byte --overlap-width 7000 --blend-radius 2000

# image_mosaic data/KH-4/DS1105-2248DA082/DS1105-2248DA082_d.tif \
#               data/KH-4/DS1105-2248DA082/DS1105-2248DA082_c.tif \
#               data/KH-4/DS1105-2248DA082/DS1105-2248DA082_b.tif \
#               data/KH-4/DS1105-2248DA082/DS1105-2248DA082_a.tif           \
#   -o data/KH-4/DS1105-2248DA082/DS1105-2248DA082.tif                                  \
#   --ot byte --overlap-width 7000 --blend-radius 2000       \
#   --rotate

# ### croping
# historical_helper.py rotate-crop                                     \
#   --interest-points '4523 1506  114956 1450  114956 9355  4453 9408' \
#   --input-path data/KH-4/DS1105-2248DA082/DS1105-2248DA082.tif                                  \
#   --output-path data/KH-4/DS1105-2248DA082/aft.tif \
#   --convert-path $HOME/miniconda3/envs/stereo2dem/imagemagick/bin/convert

# historical_helper.py rotate-crop                                     \
#   --interest-points '6335 1093  115555 1315  115536 9205  6265 8992' \
#   --input-path data/KH-4/DS1105-2248DF076/DS1105-2248DF076.tif                                  \
#   --output-path data/KH-4/DS1105-2248DF076/for.tif \
#   --convert-path $HOME/miniconda3/envs/stereo2dem/imagemagick/bin/convert

