import numpy as np
import matplotlib.pyplot as plt
import h5py
import sklearn
import sklearn.datasets
import sklearn.linear_model
import scipy.io

def load_2D_dataset():
    data = scipy.io.loadmat('datasets/data.mat')
    train_X = data['X'].T
    train_Y = data['y'].T
    test_X = data['Xval'].T
    test_Y = data['yval'].T

    plt.scatter(train_X[0, :], train_X[1, :], c=np.squeeze(train_Y), s=40, cmap=plt.cm.Spectral);
    
    return train_X, train_Y, test_X, test_Y

def sigmoid(x):
    """
    Compute the sigmoid of x

    Arguments:
    x -- A scalar or numpy array of any size.

    Return:
    sigmoid(x)
    """
    return 1/(1 + np.exp(-x))

def relu(x):
    """
    Compute the relu of x

    Arguments:
    x -- A scalar or numpy array of any size.

    Return:
    relu(x)
    """
    return np.maximum(0, x) 

def plot_decision_boundary(model, X, y):
    # Set min and max values and give it some padding
    x_min, x_max = X[0, :].min() - 1, X[0, :].max() + 1
    y_min, y_max = X[1, :].min() - 1, X[1, :].max() + 1
    h = 0.01
    # Generate a grid of points with distance h between them
    xx, yy = np.meshgrid(np.arange(x_min, x_max, h), np.arange(y_min, y_max, h))
    # Predict the function value for the whole grid
    Z = model(np.c_[xx.ravel(), yy.ravel()])
    Z = Z.reshape(xx.shape)
    # Plot the contour and training examples
    plt.contourf(xx, yy, Z, cmap = plt.cm.Spectral)
    plt.ylabel('x2')
    plt.xlabel('x1')
    plt.scatter(X[0, :], X[1, :], c = np.squeeze(y), cmap = plt.cm.Spectral)
    plt.show()




def initialize_parameters(layer_dims):
    """
    Arguments:
    layer_dims -- python array (list) containing the dimensions of each layer in our network
    
    Returns:
    parameters -- python dictionary containing your parameters "W1", "b1", ..., "WL", "bL":
                    W1 -- weight matrix of shape (layer_dims[l], layer_dims[l-1])
                    b1 -- bias vector of shape (layer_dims[l], 1)
                    Wl -- weight matrix of shape (layer_dims[l-1], layer_dims[l])
                    bl -- bias vector of shape (1, layer_dims[l])
    """
    
    np.random.seed(3)
    parameters = {}
    for l in range(1, len(layer_dims)):
        parameters['W' + str(l)] = np.random.randn(layer_dims[l], layer_dims[l-1]) / np.sqrt(layer_dims[l-1])
        parameters['b' + str(l)] = np.zeros((layer_dims[l], 1))        
    return parameters

def forward_propagation(X, parameters):
    """
    Implements the forward propagation (and computes the loss) presented in Figure 2.
    
    Arguments:
    X -- input dataset, of shape (input size, number of examples)
    Y -- true "label" vector (containing 0 if cat, 1 if non-cat)
    parameters -- python dictionary containing your parameters "W1", "b1",..., "WL", "bL":
    
    Returns:
    loss -- the loss function (vanilla logistic loss)
    """
    A = {}; Z = {}; W = {}; b = {}
    A[0] = X
    
    # no of layers
    L = len(parameters)//2
    
    # (LINEAR -> RELU)*(L-1) -> LINEAR -> SIGMOID
    for l in range(1, L + 1):
        W[l] = parameters["W" + str(l)]
        b[l] = parameters["b" + str(l)]
        Z[l] = np.dot(W[l], A[l-1]) + b[l]
        if l == L:
            A[l] = sigmoid(Z[l])
        else:
            A[l] = relu(Z[l])
            
    cache = (W, b, A, Z)
    return A[L], cache

def compute_cost(AL, Y):    
    """
    Implement the loss function
    
    Arguments:
    AL -- post-activation, output of forward propagation
    Y -- "true" labels vector, same shape as AL
    
    Returns:
    value of the cost function
    """
    return - np.nansum(Y * np.log(AL) + (1 - Y) * np.log(1 - AL))/Y.shape[1]

def backward_propagation(X, Y, cache):
    """
    Implement the backward propagation presented in figure 2.
    
    Arguments:
    X -- input dataset, of shape (input size, number of examples)
    Y -- true "label" vector (containing 0 if cat, 1 if non-cat)
    cache -- cache output from forward_propagation()
    
    Returns:
    gradients -- A dictionary with the gradients with respect to each parameter, activation and pre-activation variables
    """
    # retrieve parameters
    W, b, A, Z = cache
    # no of layers
    L = len(W) 
    # no of samples
    m = X.shape[1]
    dZ = {}; dA = {}
    dW = {}; db = {}
    
    
    
    for l in range(L, 0, -1):
        if l == L:
            dZ[l] = (A[l] - Y)/m
        else:
            dA[l] = np.dot(W[l+1].T, dZ[l+1])
            dZ[l] = dA[l] * (A[l] > 0)
        dW[l] = np.dot(dZ[l], A[l-1].T)
        db[l] = np.sum(dZ[l], axis = 1, keepdims = True)
         
    grads = (dW, db)
    return grads

def update_parameters(parameters, grads, learning_rate):
    """
    Update parameters using gradient descent
    
    Arguments:
    parameters -- python dictionary containing your parameters 
    grads -- python dictionary containing your gradients, output of n_model_backward
    
    Returns:
    parameters -- python dictionary containing your updated parameters 
                  parameters['W' + str(i)] = ... 
                  parameters['b' + str(i)] = ...
    """
    # no of layers
    L = len(parameters) // 2     
    dW, db = grads

    # Update rule for each parameter
    for l in range(1, L + 1):
        parameters["W" + str(l)] -= learning_rate * dW[l]
        parameters["b" + str(l)] -= learning_rate * db[l]      
    return parameters

def predict(X, parameters):
    """
    This function is used to predict the results of a  n-layer neural network.
    
    Arguments:
    X -- data set of examples you would like to label
    parameters -- parameters of the trained model
    
    Returns:
    p -- predictions for the given dataset X
    """
    # no of layers
    L = len(parameters)//2
    
    # Forward propagation
    AL, _ = forward_propagation(X, parameters)
    
    # convert probas to 0/1 predictions
    return (AL > 0.5)
