cam_gen --sample-file data/KH-4/DS1105-2248DF076/sample_kh4b_for_optical_bar.tsai     \
  --camera-type opticalbar                                 \
  --lon-lat-values                                         \
  '99.55 31.266 101.866 31.55 101.916 31.416 99.55 31.133' \
  data/KH-4/DS1105-2248DF076/for.tif \
  --reference-dem data/dem/SRTMGL1Ellip_kh4.tif \
  --refine-camera -o data/KH-4/DS1105-2248DF076/for.tsai

cam_gen --sample-file data/KH-4/DS1105-2248DA082/sample_kh4b_aft_optical_bar.tsai     \
  --camera-type opticalbar                                 \
  --lon-lat-values                                         \
  '99.566 31.266 101.95 31.55 101.933 31.416 99.616 31.15' \
  data/KH-4/DS1105-2248DA082/aft.tif \
  --reference-dem data/dem/SRTMGL1Ellip_kh4.tif \
  --refine-camera -o data/KH-4/DS1105-2248DA082/aft.tsai

