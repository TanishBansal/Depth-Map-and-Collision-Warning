for i in {0..197}; do \
    time{
        python monodepth_simple.py --image_path /home/tanish27bansal/monodepth/my_image$i.jpg --checkpoint_path ~/models/model_kitti; \
    }
    
done
