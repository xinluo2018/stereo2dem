## forward
cam_gen --sample-file data/KH-9/D3C1217-200742F003/sample_kh9_for_optical_bar.tsai \
  --camera-type opticalbar \
  --lon-lat-values '-123.281 46.472 -122.008 46.32 -122.032 46.136 -123.321 46.316' \
  data/KH-9/D3C1217-200742F003/for.tif \
  --reference-dem data/dem/SRTMGL1Ellip_kh9_d3c1217.tif        \
  --refine-camera -o data/KH-9/D3C1217-200742F003/for.tsai

## after
cam_gen --sample-file data/KH-9/D3C1217-200742A004/sample_kh9_aft_optical_bar.tsai \
  --camera-type opticalbar                            \
  --lon-lat-values '-123.335 46.407 -122.031 46.278 -122.1 46.1 -123.368 46.25'  \
  data/KH-9/D3C1217-200742A004/aft.tif \
  --reference-dem data/dem/SRTMGL1Ellip_kh9_d3c1217.tif         \
  --refine-camera -o data/KH-9/D3C1217-200742A004/aft.tsai

