# 1. Create coarse gridded DEM from point cloud
epsg='EPSG:32646'
coarse_tr=120
fine_tr=4
outdir=data/KH-9
refdem=data/dem/SRTMGL1Ellip_kh9.tif
img1=data/KH-9/D3C1215-100216F011/for_down025.tif
img2=data/KH-9/D3C1215-100216A012/aft_down025.tif
cam1=data/KH-9/D3C1215-100216F011/sample_kh9_for_optical_bar.tsai
cam2=data/KH-9/D3C1215-100216A012/sample_kh9_aft_optical_bar.tsai
init_stereo_dir=data/KH-9/init_stereo_d3c1215

pc_init=$init_stereo_dir/*-PC.tif
un_disp_1=$init_stereo_dir/*unaligned-D.tif
transform_1=$init_stereo_dir/run-transform.txt
ba_dir_1=$outdir/ba_extrinsic
# point2dem $pc_init --t_srs $epsg --tr $coarse_tr --errorimage
# pc_align $refdem $init_stereo_dir/*-DEM.tif \
#     --max-displacement -1 \
#     --initial-transform-from-hillshading similarity \
#     --save-transformed-source-points -o $init_stereo_dir/run

# 2. Update camera model extrinsics
# Use reference DEM 
bundle_adjust data/KH-9/D3C1215-100216F011/for.tif data/KH-9/D3C1215-100216A012/aft.tif \
     data/KH-9/D3C1215-100216F011/sample_kh9_for_optical_bar.tsai data/KH-9/D3C1215-100216A012/sample_kh9_aft_optical_bar.tsai \
    --max-iterations 50 \
    --camera-weight 0 \
    --disable-tri-ip-filter \
    --inline-adjustments \
    --ip-detect-method 1 \
    -t opticalbar \
    --datum WGS84 \
    --reference-terrain-weight 1000 \
    --parameter-tolerance 1e-12 \
    --max-disp-error 100 \
    --disparity-list $un_disp_1 \
    --reference-terrain $refdem \
    --initial-transform $transform_1 \
    -o $ba_dir_1/run

# # Run second round of stereo with updated camera models
# cam1_ex=data/KH-9/ba_extrinsic/run-*sample_kh9_for_optical_bar.tsai
# cam2_ex=data/KH-9/ba_extrinsic/run-*sample_kh9_aft_optical_bar.tsai
# stereo_dir_2=data/KH-9/stereo_extrinsic_d3c1215

# # using affineepipolar might not make sense here, is there an epipolar line existing in first place ?
# stereo $img1 $img2 $cam1_ex $cam2_ex --alignment-method affineepipolar --unalign-disparity $stereo_dir_2/run 

# #Create updated coarse gridded DEM
# pc_ex=$(realpath $stereo_dir_2/*-PC.tif)
# un_disp_2=$(realpath $stereo_dir_2/*unaligned-D.tif)
# point2dem $pc_ex --t_srs $epsg --tr $coarse_tr  --errorimage 
# dem_2=$(realpath $stereo_dir_2/*-DEM.tif)

# #Align updated coarse DEM to reference DEM
# pc_align $refdem $dem_2 --max-displacement -1 \
#     --initial-transform-from-hillshading similarity \
#     --save-transformed-source-points \
#     -o $stereo_dir_2/run

# transform_2=$(realpath $stereo_dir_2/*-transform.txt)

# # 3. Optimise for camera model intrinsics
# $ba_dir_2=$outdir/ba_intrinsic
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


# #Run final round of stereo
# cam1_in=$ba_dir_2/run-*$cam1_ex
# cam2_in=$ba_dir_2/run-*$cam2_ex
# stereo_dir_3=$outdir/stereo_in_d3c1215
# stereo $img1 $img2 $cam1_in $cam2_in --alignment-method affineepipolar --unalign-disparity $stereo_dir_3/run
# pc_in=$(realpath $stereo_dir_3/*-PC.tif)
# l_img=$(realpath $stereo_dir_3/*-L.tif)

# #Create final gridded DEM and confirming orthoimage at fine resolution
# point2dem $pc_in $l_img --t_srs $epsg --tr $fine_tr --orthoimage --errorimage
# dem_fin=$(realpath $stereo_dir3/*-DEM.tif)
# ortho_fin=$(realpath $stereo_dir3/*-DRG.tif)
# #At this stage, since our cameras still do not confirm to the reference DEM 100%, our best shot at orthoimage is one from point2dem


# #Create ortho image from left image
# #TODO: create orthoimages from both inputs, use original filenames, not "left/right"
# #ortho=$outdir/${img1%.*}_ortho.tif
# ortho=$outdir/left_ortho.tif
# ortho_dem=$refdem
# #ortho_dem=$dem_fin
# mapproject -t opticalbar $ortho_dem --t_srs $epsg $img1 $cam1_in $ortho
