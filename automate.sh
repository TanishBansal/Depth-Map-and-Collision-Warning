cd /home/tanish27bansal/monodepth/
sudo rm  Images/Raw/*
sudo rm  ImagesNormal/Raw/*
sudo rm  VideoInput/videoN.mp4
sudo rm  Output/*
sudo rm  darknet/collisions/*
#sudo rm  /home/tanish27bansal/monodepth/utils/filensame/list.txt
#sudo rm  /home/tanish27bansal/monodepth/VideoOutput/*
cd 
cd /home/tanish27bansal/monodepth/ 
ffmpeg -i VideoInput/video.mp4 -vf fps=20 ImagesNormal/Raw/my_image%01d.jpg -hide_banner
ffmpeg -i VideoInput/video.mp4 -vf scale=512:256 VideoInput/videoN.mp4  -hide_banner
ffmpeg -i VideoInput/videoN.mp4 -vf fps=20 Images/Raw/my_image%01d.jpg -hide_banner
python writeToFile.py
sudo python monodepth_main.py --mode test --data_path /home/tanish27bansal/monodepth/ --filenames_file /home/tanish27bansal/monodepth/utils/filenames/list.txt --output_directory /home/tanish27bansal/monodepth/Output --checkpoint_path /home/tanish27bansal/monodepth/model/model_city2kitti
ffmpeg -framerate 20 -i Output/image%01d_disp.png VideoOutput/video.mp4
cd /home/tanish27bansal/monodepth/VideoOutput/
m=$(ls -1 --file-type | grep -v '/$' | wc -l)
cd
mv /home/tanish27bansal/monodepth/VideoOutput/video.mp4 /home/tanish27bansal/monodepth/VideoOutput/video$m.mp4 


cd /home/tanish27bansal/monodepth/darknet/
python writeToFile2.py
./darknet detector test obj.data yolov3.cfg yolo-obj_30800.weights -dont_show < data/t.txt > result.txt -thresh 0.2

tail -n +4 <result.txt >r.txt
#cd /home/tanish27bansal/monodepth/Images/Raw/
#o=$(ls -1 --file-type | grep -v '/$' | wc -l)
#export bo
#echo $bo
#cd /home/tanish27bansal/monodepth/darknet/
python3 depth.py
ffmpeg -framerate 20 -i collisions/collisions%01d.jpg VideoOutput/video.mp4
cd /home/tanish27bansal/monodepth/darknet/VideoOutput/
m=$(ls -1 --file-type | grep -v '/$' | wc -l)
mv /home/tanish27bansal/monodepth/darknet/VideoOutput/video.mp4 /home/tanish27bansal/monodepth/darknet/VideoOutput/video$m.mp4 


#cd /home/tanish27bansal/monodepth/VideoInput/
#m=$(ls -1 --file-type | grep -v '/$' | wc -l)
#cd
#mv /home/tanish27bansal/monodepth/VideoInput/video.mp4 /home/tanish27bansal/monodepth/VideoInput/video($(ls -l | grep ^- | wc -l)).mp4 
#sudo rm - /home/tanish27bansal/monodepth/VideoInput/*
