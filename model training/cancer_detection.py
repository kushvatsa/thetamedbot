
import os
import gc
from PIL import Image

import tqdm
import numpy as np
from keras.models import Sequential
from sklearn.model_selection import train_test_split
from keras.preprocessing.image import ImageDataGenerator
from keras.layers import Dense, Conv2D, MaxPooling2D, Flatten, Dropout, LeakyReLU
from keras.applications import VGG16
import tensorflow as tf
from sklearn.utils import check_random_state
from tensorflow.python.keras.models import load_model
import ssl
ssl._create_default_https_context = ssl._create_unverified_context

np.random.seed(0);
tf.random.set_seed(0);
check_random_state(0);

def load_data(path_to_train_benign,path_to_train_malignant,path_to_test_benign,path_to_test_malignant):
    train_images, test_images = [], []
    train_labels, test_labels = [], []
    for img_path in os.listdir(path_to_train_benign):
        train_images.append(path_to_train_benign + img_path)
        train_labels.append(0)

    for img_path in os.listdir(path_to_train_malignant):
        train_images.append(path_to_train_malignant + img_path)
        train_labels.append(1)

    for img_path in os.listdir(path_to_test_benign):
        test_images.append(path_to_test_benign + img_path)
        test_labels.append(0)

    for img_path in os.listdir(path_to_test_malignant):
        test_images.append(path_to_test_malignant + img_path)
        test_labels.append(1)

    train_images, test_images = np.array(train_images), np.array(test_images)
    train_labels, test_labels = np.array(train_labels), np.array(test_labels)

    distribution = np.bincount(np.concatenate([train_labels, test_labels]))

    print('TRAIN SET SIZE :', len(train_images))
    print('TEST SET SIZE:', len(test_images))
    print(distribution[0], 'BENIGN ', distribution[1], 'MALIGNANT')

    # Load the images to memory
    X_train, X_test = [], []
    Y_train, Y_test = train_labels, test_labels

    for file in tqdm.tqdm(train_images):
        X_train.append(np.array(Image.open(file)))

    for file in tqdm.tqdm(test_images):
        X_test.append(np.array(Image.open(file)))

    del train_images, test_images, train_labels, test_labels
    X_train, X_test = np.array(X_train), np.array(X_test)

    features = np.concatenate([X_train, X_test])
    labels = np.concatenate([Y_train, Y_test])

    return features, labels


# model VGG16
def model_vgg():
    model = Sequential()

    model.add(VGG16(include_top=False, input_shape=(224, 224, 3,)))
    model.add(Flatten())
    model.add(Dense(32))
    model.add(LeakyReLU(0.001))
    model.add(Dense(16))
    model.add(LeakyReLU(0.001))
    model.add(Dense(2, activation='softmax'))
    model.layers[0].trainable = False

    model.compile(loss='sparse_categorical_crossentropy', optimizer='adam', metrics=['acc'])
    #model.summary()
    return model
def train_model(model,n_epochs,batch_size):
    history = model.fit(X_train_new, Y_train_new, validation_data=(X_val, Y_val), epochs=n_epochs, batch_size=batch_size,
                        shuffle=True)


#model.save('skin_cancer_softmax.h5')
if __name__ == '__main__':
    features, labels = load_data('./dataset/data/train/benign', './dataset/data/train/malignant/', './dataset/data/test/benign', './dataset/data/test/malignant/')
    # Spliting data to train, validation and test values
    X_train, X_test, Y_train, Y_test = train_test_split(features, labels, test_size=.1, random_state=0)
    X_train_new, X_val, Y_train_new, Y_val = train_test_split(X_train, Y_train, test_size=.05, random_state=0,
                                                              shuffle=False)

    gc.collect()
    # add generator to enlarge training data by adding rotations etc.
    data_generator = ImageDataGenerator(rotation_range=90,
                                        width_shift_range=0.15,
                                        height_shift_range=0.15,
                                        horizontal_flip=True,
                                        vertical_flip=True,
                                        brightness_range=[0.8, 1.1],
                                        fill_mode='nearest')

    new_samples, new_labels = next(data_generator.flow(X_train_new, Y_train_new, batch_size=len(X_train_new)))
    X_train_new = np.concatenate([X_train_new, new_samples])
    Y_train_new = np.concatenate([Y_train_new, new_labels])

    del new_samples, new_labels
    print('New number of training samples:', len(X_train_new))

    # Normalizing values
    X_train_new = X_train_new.astype('float32') / 255.
    X_test = X_test.astype('float32') / 255.
    X_val = X_val.astype('float32') / 255.

    print('Training data shape:', X_train_new.shape)
    print('Min value:', X_train_new.min())
    print('Max value:', X_train_new.max())
    model = model_vgg()
    # Train the model
    n_epochs = 50
    batch_size=64
    train_model(model,n_epochs,batch_size)
    print('Accuracy on test set:', model.evaluate(X_test, Y_test)[1])
