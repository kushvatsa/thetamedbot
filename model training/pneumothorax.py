# mounting the drive cloud for loading the dataset and saving the resaults
from google.colab import drive
drive.mount('/content/drive')
!pip install -q keras
!pip install opencv-python

# importing the needed libraries
import glob
import cv2
import os
import numpy as np
from keras.utils import np_utils
from keras.models import Sequential
from keras.layers import Dense
from keras.optimizers import SGD
from keras.losses import categorical_crossentropy
success=True;

# loading the dataset from the drive
train_path="/content/drive/My Drive/colab/dataset/chestXRay/cleaned ches-X Ray/train"
test_path="/content/drive/My Drive/colab/dataset/chestXRay/cleaned ches-X Ray/test"
categories=["0","1"]
train_image=[]
train_label=[]
size=300
for category in categories:
  path=os.path.join(train_path,category) #path to the train folder
  for img in os.listdir(path):
    image_array=cv2.imread(os.path.join(path,img),cv2.IMREAD_GRAYSCALE)
    img = cv2.resize(image_array,(size,size))
    train_image.append(img)
    train_label.append(category)
	
	
test_image=[]
test_label=[]
for category in categories:
  path=os.path.join(test_path,category) #path to the train folder
  for img in os.listdir(path):
    image_array=cv2.imread(os.path.join(path,img),cv2.IMREAD_GRAYSCALE)
    img = cv2.resize(image_array,(size,size))
    test_image.append(img)
    test_label.append(category)
	
	
	
	
	
	
	
	
	
# building the model
#from tensorflow.keras.datasets import cifar10
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Flatten, Conv2D
from tensorflow.keras.losses import binary_crossentropy
from tensorflow.keras.optimizers import Adam

# Model configuration
batch_size = 128
img_width, img_height, img_num_channels = size, size, 1
loss_function = binary_crossentropy
no_classes = 2
no_epochs = 10
optimizer = Adam()
validation_split = 0.15
verbosity = 1


#(input_train, target_train), (input_test, target_test) = cifar10.load_data()

# Determine shape of the data
input_shape = (img_width, img_height, img_num_channels)

# Parse numbers as floats
#input_train = train_image.astype('float32')
#input_test = train_label.astype('float32')

# Scale data for normalization
#input_train = input_train / 255
#input_test = input_test / 255

# Create the model
model = Sequential()
model.add(Conv2D(32, kernel_size=(3, 3), activation='relu', input_shape=input_shape))
model.add(Conv2D(64, kernel_size=(3, 3), activation='relu'))
model.add(Conv2D(128, kernel_size=(3, 3), activation='relu'))
model.add(Flatten())
model.add(Dense(128, activation='relu'))
model.add(Dense(no_classes, activation='softmax'))

# Compile the model
model.compile(loss=loss_function,
              optimizer=optimizer,
              metrics=['accuracy'])

# Fit data to model
history = model.fit(train_image, train_label,
            batch_size=batch_size,
            epochs=no_epochs,
            verbose=verbosity,
            validation_split=validation_split)
