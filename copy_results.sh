if [[ $1 = "cpu" ]] || [[ $1 = "gpu" ]] ; then
    echo "copy ${1}"
else
    echo "invalid device: $1"
    return
fi


# for train
for epoch in {4..100}; do
    rm -rf feature_map_epoch$epoch
    rm -rf delta_epoch$epoch
done
rm -rf /home/alvinox/workspace/data/train_gd_data/yolov3_tiny_coco_${1}_fm_epoch*
rm -rf /home/alvinox/workspace/data/train_gd_data/yolov3_tiny_coco_${1}_delta_epoch*
for epoch in {1..3}; do
    cp feature_map_epoch$epoch /home/alvinox/workspace/data/train_gd_data/yolov3_tiny_coco_${1}_fm_epoch$epoch -r
    cp delta_epoch$epoch /home/alvinox/workspace/data/train_gd_data/yolov3_tiny_coco_${1}_delta_epoch$epoch -r
done

#copy weights
#./darknet split_weights cfg/yolov3-tiny.cfg yolov3-tiny-coco-init.weights
#cp splited_weights/* ~/workspace/data/splited_weights/train_init_yolov3_tiny_coco/
#cp yolov3-tiny-coco-init.weights ~/workspace/data/splited_weights/train_init_yolov3_tiny_coco/
