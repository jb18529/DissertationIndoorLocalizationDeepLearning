Dissertation: Building Indoor Localization with Deep Learning using Unconstrained Images.

The initial idea of this project was to develop an indoor navigation that could allow a user or robot to navigate their indoor environment with only a mobile device. One of the main impediments to creating a system has been solving the indoor localisation problem allowing the user to accurately identify where they are in an indoor setting. Out of the multitude of studies attempting to solve indoor localisation in the context of navigation, only a small minority have attempted to
develop a navigation system based purely on 2D images with a deep learning method asthe core component of the solution. In addition many approaches were quite complex and challenging to set up and maintain. 

I proposed, designed and prototyped a simpler, lightweight indoor localization system using a convolutional neural network classifier and a hidden Markov model to identify various locations inside the School of Computer Science building at the University of Nottingham. The network was trained using 2D images from a smartphone and I captured images and created two datasets to train the network.

The main.ipynb file contains the code for the data preprocessing and convolutional neural network and the hmm.ipynb file contains the code for the hidden Markov model.

The IndoorDatasetTrain and IndoorDatasetTest folders contain the 288-dataset which emphasized a full 360 degree view of the indoor environment. The TRAIN and TEST folders contain the 576-dataset captured two or three viewpoints with more images per class.

The F1 score was around 50% for both datasets with CA score increasing by 12% when the model was trained on the 576-dataset. Whilst the CNN model on its own had poor performance metrics the HMM model was able to correct 100% of the misclassification/errors seen in the CNN model after implementing a manually coded emission probability matrix in the HMM.

For more info: My dissertation paper is named JoelsDissertation.pdf

