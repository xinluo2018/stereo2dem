# ### mosaic

## after image
# image_mosaic                                        \
#   data/KH-9/D3C1217-200742A004/D3C1217-200742A004_a.tif \
#   data/KH-9/D3C1217-200742A004/D3C1217-200742A004_b.tif \
#   data/KH-9/D3C1217-200742A004/D3C1217-200742A004_c.tif \
#   data/KH-9/D3C1217-200742A004/D3C1217-200742A004_d.tif \
#   --ot byte \
#   --overlap-width 3000                    \
#   -o data/KH-9/D3C1217-200742A004/D3C1217-200742A004.tif

# ## forward image
# image_mosaic                                        \
#   data/KH-9/D3C1217-200742F003/D3C1217-200742F003_a.tif \
#   data/KH-9/D3C1217-200742F003/D3C1217-200742F003_b.tif \
#   data/KH-9/D3C1217-200742F003/D3C1217-200742F003_c.tif \
#   data/KH-9/D3C1217-200742F003/D3C1217-200742F003_d.tif \
#   --overlap-width 1000     \
#   --ot byte \
#   -o data/KH-9/D3C1217-200742F003/D3C1217-200742F003.tif \
#   --rotate

## croping
# ## after image
# historical_helper.py rotate-crop      \
#   --input-path data/KH-9/D3C1217-200742A004/D3C1217-200742A004.tif \
#   --output-path data/KH-9/D3C1217-200742A004/aft.tif               \
#   --interest-points '1300 1200 116748 1200 116800 22800 1300 22900' \
#   --convert-path $HOME/miniconda3/envs/stereo2dem/imagemagick/bin/convert

# ## forward image
# historical_helper.py rotate-crop      \
#   --input-path data/KH-9/D3C1217-200742F003/D3C1217-200742F003.tif \
#   --output-path data/KH-9/D3C1217-200742F003/for.tif               \
#   --interest-points '4300 4000 123800 1500 123800 23100 4900 24400' \
#   --convert-path $HOME/miniconda3/envs/stereo2dem/imagemagick/bin/convert

# ## downsampling
# gdal_translate -outsize 10% 10% -r average data/KH-9/D3C1217-200742F003/for.tif data/KH-9/D3C1217-200742F003/for_down01.tif
# gdal_translate -outsize 10% 10% -r average data/KH-9/D3C1217-200742A004/aft.tif data/KH-9/D3C1217-200742A004/aft_down01.tif



