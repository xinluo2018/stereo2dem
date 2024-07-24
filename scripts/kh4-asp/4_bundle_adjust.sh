# stereo_gui data/KH-4/DS1105-2248DF076/for.tif data/KH-4/DS1105-2248DA082/aft.tif --create-image-pyramids-only
# ln -s for_sub8.tif data/KH-4/DS1105-2248DF076/for_small.tif
# ln -s aft_sub8.tif data/KH-4/DS1105-2248DA082/aft_small.tif
# cp data/KH-4/DS1105-2248DF076/for.tsai data/KH-4/DS1105-2248DF076/for_small.tsai
# cp data/KH-4/DS1105-2248DA082/aft.tsai data/KH-4/DS1105-2248DA082/aft_small.tsai

# bundle_adjust data/KH-4/DS1105-2248DF076/for_small.tif data/KH-4/DS1105-2248DA082/aft_small.tif \
#   data/KH-4/DS1105-2248DF076/for_small.tsai data/KH-4/DS1105-2248DA082/aft_small.tsai           \
#   -t opticalbar                           \
#   --max-iterations 100                    \
#   --camera-weight 0                       \
#   --tri-weight 0.1                        \
#   --tri-robust-threshold 0.1              \
#   --disable-tri-ip-filter                 \
#   --skip-rough-homography                 \
#   --inline-adjustments                    \
#   --ip-detect-method 1                    \
#   --datum WGS84                           \
#   -o data/KH-4/ba_small/run

