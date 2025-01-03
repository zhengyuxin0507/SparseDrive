bash ./tools/dist_test.sh \
    projects/configs/sparsedrive_small_stage1.py \
    work_dirs/sparsedrive_small_stage1/latest.pth \
    1 \
    --deterministic \
    --eval bbox 
    # --result_file ./work_dirs/sparsedrive_small_stage2/results.pkl