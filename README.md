# Depth-Map-and-collision-warning

####  Introduction

Calculating Depth Maps/Disparity Maps from Monocular Images (Single Image)
using Neural Network (Both VGG-16 and Resnet50) with post processing. The
Network Works at 22fps for an Image (1240 * 720), 4 times the speed can be
obtained for every 50% reduction in the Input Image. From the Depth/Disparity Map
we can obtain relative distances of the object in the frame (the brighter pixels are
nearer and so on) and give collision warning.

#### Requirements 

This code was tested with Tensorflow 1.0, CUDA 9.0, OpenCV <= 3.4.0, cuDNN v5-v7 and Ubuntu 16.04.

#### Build using Repositories

[darknet](https://github.com/AlexeyAB/darknet) and [monodepth](https://github.com/mrharicot/monodepth#training)

Pretrained weights can be downloaded from the above repos.


#### README for the bash script:(automate.sh)

1. Convert the input video into frames with 20fps as the speed.
2. Create another copy of each frame and resize it to dimensions 512x256.
3. Run the Monodepth model sequentially on the resized frames. A numpy array of
dimensions N x 512 x 256 is generated where N is the frame number.
4. Run the YOLO model on the first set of frames to find the objects detected in
each frame. The centroid co-ordinates of the bounding boxes along with the class
names are stored in a text file.
5. Run the python script which takes the numpy array from the Monodepth model
and the text file from the YOLO model as inputs. Distance (in meters) to the
specific objects is found by correlating the centroid co-ordinates with the numpy
array and computing based on a formula. The distance to each object along with
the object name is written on each frame.
6. A predetermined value is set as the range. Any object whose distance falls under
this range causes a “COLLISION WARNING!” message to be displayed. The
message is written on each frame whenever this condition occurs.
7. Finally, convert the frames into video.

#### Workflow

1) Go to monodepth folder which inside has yolo/darknet
2) Run automate.sh bash script as superuser
3) It automatically does the above
4) Changes were made to monodepth model to output disparities using matplotlib
for visual understanding along with numpy arrays
5) Python Scripts to write frame names to text file for inferring for both monodepth
and yolo
6) Depth.py to write distance on each frames with the help of centroids stored in
another file.
7) Finally combining everything together using ffmpeg




[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/VDFA1ZKOOUc/0.jpg)]
(https://www.youtube.com/watch?v=VDFA1ZKOOUc)


[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/XWE1pwO1bas/0.jpg)]
(https://www.youtube.com/watch?v=XWE1pwO1bas)

