from cancer_detection import load_data,train_model

import numpy as np
from keras.models import Sequential
from sklearn.model_selection import train_test_split
from keras.preprocessing.image import ImageDataGenerator
from keras.layers import Dense, Conv2D, MaxPooling2D, Flatten, Dropout
import tensorflow as tf
from sklearn.utils import check_random_state
import ssl
ssl._create_default_https_context = ssl._create_unverified_context

np.random.seed(0);
tf.random.set_seed(0);
check_random_state(0);
def model_conv():
    model=Sequential()
    model.add(Conv2D(32, (3, 3,), activation='relu', input_shape=(224, 224, 3,)))
    model.add(Conv2D(32, (3, 3,), activation='relu', padding='same'))
    model.add(MaxPooling2D((2, 2,)))
    model.add(Dropout(.25))
    model.add(Conv2D(64, (3, 3,), activation='relu', padding='same'))
    model.add(Conv2D(64, (3, 3,), activation='relu', padding='same'))
    model.add(MaxPooling2D((2, 2,)))
    model.add(Dropout(.4))
    model.add(Flatten())
    model.add(Dense(128, activation='relu'))
    model.add(Dropout(.5))
    model.add(Dense(2, activation='softmax'))
    model.compile(loss='sparse_categorical_crossentropy', optimizer='adam', metrics=['acc'])
    return model

if __name__ == '__main__':
    features, labels = load_data('./dataset/data/train/benign', './dataset/data/train/malignant/', './dataset/data/test/benign', './dataset/data/test/malignant/')
    # Spliting data to train, validation and test values
    X_train, X_test, Y_train, Y_test = train_test_split(features, labels, test_size=.1, random_state=0)
    X_train_new, X_val, Y_train_new, Y_val = train_test_split(X_train, Y_train, test_size=.05, random_state=0,
                                                              shuffle=False)

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
    model = model_conv()
    n_epochs = 40
    batch_size=32
    train_model(model,n_epochs,batch_size)
    print('Accuracy on test set:', model.evaluate(X_test, Y_test)[1])
