mapproject data/dem/SRTMGL1Ellip_kh4.tif data/KH-4/DS1105-2248DF076/for.tif data/KH-4/DS1105-2248DF076/for.tsai data/KH-4/DS1105-2248DF076/for.map.tif
mapproject data/dem/SRTMGL1Ellip_kh4.tif data/KH-4/DS1105-2248DA082/aft.tif data/KH-4/DS1105-2248DA082/aft.tsai data/KH-4/DS1105-2248DA082/aft.map.tif


# parallel_stereo --stereo-algorithm asp_mgm                \
#   data/KH-4/DS1105-2248DF076/DS1105-2248DF076_crop_sub8.tif data/KH-4/DS1105-2248DA082/DS1105-2248DA082_crop_sub8.tif                             \
#   data/KH-4/ba_small/run-for_small.tsai data/KH-4/ba_small/run-aft_small.tsai \
#   --subpixel-mode 9                                       \
#   --alignment-method affineepipolar                       \
#   -t opticalbar --skip-rough-homography                   \
#   --disable-tri-ip-filter                                 \
#   --ip-detect-method 1                                    \
#   data/KH-4/stereo_small_mgm/run

# point2dem --stereographic --proj-lon 100.50792 --proj-lat 31.520417 \
#   --tr 30 data/KH-4/stereo_small_mgm/run-PC.tif

# pc_align --max-displacement -1                                      \
#   --initial-transform-from-hillshading similarity                   \
#   --save-transformed-source-points --num-iterations 0               \
#   --max-num-source-points 1000 --max-num-reference-points 1000      \
#   data/dem/SRTMGL1Ellip_kh4.tif data/KH-4/stereo_small_mgm/run-DEM.tif -o data/KH-4/stereo_small_mgm/run

# point2dem --stereographic --proj-lon 100.50792 --proj-lat 31.520417 \
#   --tr 30 data/KH-4/stereo_small_mgm/run-trans_source.tif

# pc_align --max-displacement -1 data/dem/SRTMGL1Ellip_kh4.tif data/dem/SRTMGL1Ellip_kh4.tif -o data/KH-4/dem/dem             \
#   --num-iterations 0 --max-num-source-points 1000                     \
#   --max-num-reference-points 1000 --save-transformed-source-points

# point2dem --stereographic --proj-lon 100.50792 --proj-lat 31.520417   \
#   --tr 120 data/KH-4/dem/dem-trans_source.tif

