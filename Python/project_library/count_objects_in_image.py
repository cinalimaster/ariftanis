import cv2
import numpy as np
import matplotlib.pyplot as plt
import cvlib as cv
from cvlib.object_detection import draw_bbox
from numpy.lib.polynomial import poly

image = cv2.imread("cars.jpeg")
box, label, count = cv.detect_common_objects(image)
output = draw_bbox(image, box, label, count)
plt.imshow(output)
plt.show()
print("Number of cars in this image are " +str(label.count('car')))

"""Count Objects in Image using Python
Default image AMAN KHARWALMAY 11, 2021MACHINE LEARNING4
Counting objects in an image is the task of computer vision. There are a bunch of computer vision 
libraries in Python that you can use for this task. But in this article, I will take you through 
a very simple approach to count objects in an image using Python.

How to Count Objects in an Image using Python?
Counting objects in an image is a task of computer vision. There are many computer vision libraries
that you can use for this task, such as OpenCV, TensorFlow, PyTorch, Scikit-image, and cvlib. 
You must have not heard much about the cvlib library in Python. Well, this is a very simple, high
level, and easy to use computer vision library in Python.

By using the features of this library we can count the number of objects in an image using Python.
To use this library, make sure you have OpenCV and TensorFlow installed in your systems. You can 
easily install it by using the pip command; pip install cvlib.

Count Objects in an Image using Python
Now let’s see how to use the cvlib library to count the number of objects in an image using the 
Python programming language. I will first read an image by using the OpenCV library, then I will 
detect all the objects using cvlib and count the number of particular objects. The image that I am 
going to use for this task is shown below.

https://i0.wp.com/thecleverprogrammer.com/wp-content/uploads/2021/05/cars.jpeg?resize=768%2C576&ssl=1

image used for object detection
As you can see the image that I am using here for the task of counting objects in an image using 
Python contains vehicles in it. So I will first detect all the vehicles and then count the number 
of cars out of them. So below is how you can count the number of cars in an image using Python:

view rawcount objects.py hosted with ❤ by GitHub
After running the above code, you will get to see an image as an output as shown below:

https://i1.wp.com/thecleverprogrammer.com/wp-content/uploads/2021/05/cars.png?resize=768%2C585&ssl=1

Count Objects in Image using Python
After closing this image you will get to see the final output in your terminal as shown below.
Number of cars in this image are 10
Summary
So this is how you can count the number of objects by using the cvlib library in Python. You can 
use this library for all the tasks of computer vision. I hope you liked this article on how to 
count an object in an image using Python. Feel free to ask your valuable questions in the comments 
section below."""
