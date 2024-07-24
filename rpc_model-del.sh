# convert_pinhole_model data/KH-4/DS1105-2248DF076/DS1105-2248DF076_crop_sub8.tif data/KH-4/ba_small/run-for_small.tsai \
#   -o data/KH-4/DS1105-2248DF076/for_small_rpc.tsai --output-type RPC          \
#   --camera-to-ground-dist 300000                   \
#   --sample-spacing 50 --rpc-degree 2

# convert_pinhole_model data/KH-4/DS1105-2248DA082/DS1105-2248DA082_crop_sub8.tif data/KH-4/ba_small/run-aft_small.tsai \
#   -o data/KH-4/DS1105-2248DA082/aft_small_rpc.tsai --output-type RPC          \
#   --camera-to-ground-dist 300000                   \
#   --sample-spacing 50 --rpc-degree 2


# bundle_adjust data/KH-4/DS1105-2248DF076/DS1105-2248DF076_crop_sub8.tif data/KH-4/DS1105-2248DA082/DS1105-2248DA082_crop_sub8.tif                       \
#   data/KH-4/DS1105-2248DF076/for_small_rpc.tsai data/KH-4/DS1105-2248DA082/aft_small_rpc.tsai                         \
#   -o data/KH-4/ba_rpc/run --max-iterations 200                            \
#   --camera-weight 0 --disable-tri-ip-filter                     \
#   --skip-rough-homography --inline-adjustments                  \
#   --ip-detect-method 1 -t nadirpinhole --datum WGS84            \
#   --force-reuse-match-files --reference-terrain-weight 1000     \
#   --parameter-tolerance 1e-12 --max-disp-error 100              \
#   --disparity-list data/KH-4/stereo/run-unaligned-D.tif                   \
#   --max-num-reference-points 40000 --reference-terrain data/dem/SRTMGL1Ellip_kh4.tif \
#   --solve-intrinsics                                            \
#   --intrinsics-to-share 'focal_length optical_center'           \
#   --intrinsics-to-float other_intrinsics --robust-threshold 10  \
#   --initial-transform data/KH-4/pc_align/run-transform.txt


