## params setting.
# epsg='EPSG:32646'  ## for d3c1215
epsg='EPSG:32610'    ## for d3c1217
coarse_tr=120
fine_tr=4
outdir=data/KH-9
refdem=data/dem/SRTMGL1Ellip_kh9_d3c1217.tif
img1=data/KH-9/D3C1217-200742F003/for.tif
img2=data/KH-9/D3C1217-200742A004/aft.tif
cam1=data/KH-9/D3C1217-200742F003/for.tsai
cam2=data/KH-9/D3C1217-200742A004/aft.tsai
init_stereo_dir=data/KH-9/stereo_init_d3c1217

# 1. Run stereo with initial camera models
stereo $img1 $img2 $cam1 $cam2 --alignment-method affineepipolar --unalign-disparity $init_stereo_dir/run

pc_init=$init_stereo_dir/*-PC.tif
# point2dem $pc_init --t_srs $epsg --tr $coarse_tr --errorimage
# pc_align $refdem $init_stereo_dir/*-DEM.tif \
#     --max-displacement -1 \
#     --initial-transform-from-hillshading similarity \
#     --save-transformed-source-points -o $init_stereo_dir/run

### 2. Optimise the extrinsics params of camera model 
un_disp_1=$init_stereo_dir/*unaligned-D.tif
transform_1=$init_stereo_dir/run-transform.txt
ba_dir_1=$outdir/ba_extrinsic_d3c1217
### 2.1 Calculate the extrinsics params by using bundle adjustment. 
# bundle_adjust $img1 $img2 $cam1 $cam2 \
#     --max-iterations 20 \
#     --camera-weight 0 \
#     --disable-tri-ip-filter \
#     --inline-adjustments \
#     --ip-detect-method 1 \
#     -t opticalbar \
#     --datum WGS84 \
#     --reference-terrain-weight 1000 \
#     --parameter-tolerance 1e-12 \
#     --max-disp-error 100 \
#     --disparity-list $un_disp_1 \
#     --reference-terrain $refdem \
#     --initial-transform $transform_1 \
#     -o $ba_dir_1/run

### 2.2 Update the camera params and run the second round of stereo
cam1_ex=data/KH-9/ba_extrinsic_d3c1217/run-*for.tsai
cam2_ex=data/KH-9/ba_extrinsic_d3c1217/run-*aft.tsai
stereo_dir_2=data/KH-9/stereo_extrinsic_d3c1217
# stereo $img1 $img2 $cam1_ex $cam2_ex --alignment-method affineepipolar --unalign-disparity $stereo_dir_2/run 

## 2.3 Generating DEM and align to the srtm dem.
pc_ex=$(realpath $stereo_dir_2/*-PC.tif)

# point2dem $pc_ex --t_srs $epsg --tr $coarse_tr  --errorimage 
# dem_2=$(realpath $stereo_dir_2/*-DEM.tif)
# pc_align $refdem $dem_2 --max-displacement -1 \
#     --initial-transform-from-hillshading similarity \
#     --save-transformed-source-points \
#     -o $stereo_dir_2/run

## 3. Optimise the intrinsics params of camera model 
transform_2=$(realpath $stereo_dir_2/run-transform.txt)
un_disp_2=$(realpath $stereo_dir_2/*unaligned-D.tif)
ba_dir_2=$outdir/ba_intrinsic_d3c1217
# 3.1 Calculate the intrinsics params by using bundle adjustment. 
# bundle_adjust $img1 $img2 $cam1_ex $cam2_ex \
#     -t opticalbar \
#     --force-reuse-match-files \
#     --max-iterations 30 \
#     --camera-weight 0 \
#     --disable-tri-ip-filter \
#     --inline-adjustments \
#     --ip-detect-method 1 \
#     --datum WGS84 \
#     --num-passes 2 \
#     --solve-intrinsics \
#     --intrinsics-to-float "focal_length optical_center other_intrinsics" \
#     --intrinsics-to-share "focal_length optical_center" \
#     --ip-per-tile 1000 \
#     --intrinsics-limits "0.95 1.05 0.90 1.10 0.90 1.10 0.5 1.5 -5.0 5.0 0.3 2.0" \
#     --num-random-passes 2 \
#     --max-disp-error 100 \
#     --disparity-list $un_disp_2 \
#     --reference-terrain $refdem \
#     --initial-transform $transform_2 \
#     --reference-terrain-weight 1000 \
#     -o $ba_dir_2/run

## 3.2 Update the camera params and run the third round of stereo
# cam1_in=$ba_dir_2/run-*$cam1_ex
# cam2_in=$ba_dir_2/run-*$cam2_ex
# stereo_dir_3=$outdir/stereo_in_d3c1215
# stereo $img1 $img2 $cam1_in $cam2_in --alignment-method affineepipolar --unalign-disparity $stereo_dir_3/run
# pc_in=$(realpath $stereo_dir_3/*-PC.tif)
# l_img=$(realpath $stereo_dir_3/*-L.tif)

## 2.3 Create the final DEM.
# point2dem $pc_in $l_img --t_srs $epsg --tr $fine_tr --orthoimage --errorimage
# dem_fin=$(realpath $stereo_dir3/*-DEM.tif)
# ortho_fin=$(realpath $stereo_dir3/*-DRG.tif)
# #At this stage, since our cameras still do not confirm to the reference DEM 100%, our best shot at orthoimage is one from point2dem

## 2.4 Create ortho image from the stereo images.
# #ortho=$outdir/${img1%.*}_ortho.tif
# ortho=$outdir/left_ortho.tif
# ortho_dem=$refdem
# #ortho_dem=$dem_fin
# mapproject -t opticalbar $ortho_dem --t_srs $epsg $img1 $cam1_in $ortho

