import sys
import json
import pandas as pd
import numpy as np
import joblib

# Load the scaler, encoder, and model
scaler = joblib.load('scaler.joblib')
encoder = joblib.load('encoder.joblib')
model = joblib.load('model.pkl')

# Function to preprocess input data
def preprocess_input(input_data):
    # Convert input data to DataFrame
    data = pd.DataFrame({
        'Age': [input_data['Age']],
        'Temperature': [input_data['Temperature']],
        'Animal': [input_data['Animal']],
        'Symptom 1': [input_data['Symptom1']],
        'Symptom 2': [input_data['Symptom2']],
        'Symptom 3': [input_data['Symptom3']],
    })

    # Scale numerical features
    numerical_features = ['Age', 'Temperature']
    data[numerical_features] = scaler.transform(data[numerical_features])

    # One-hot encode categorical features
    encoded_features = encoder.transform(data[['Animal', 'Symptom 1', 'Symptom 2', 'Symptom 3']])
    encoded_columns = encoder.get_feature_names_out(['Animal', 'Symptom 1', 'Symptom 2', 'Symptom 3'])
    encoded_df = pd.DataFrame(encoded_features, columns=encoded_columns)

    # Concatenate numerical and encoded categorical features
    X_final = pd.concat([data[numerical_features], encoded_df], axis=1)

    return X_final

# Read input data from stdin
input_data_json = sys.stdin.readline()
input_data = json.loads(input_data_json)

# Preprocess input data
preprocessed_input = preprocess_input(input_data)

# Make predictions
predictions = model.predict(preprocessed_input)

predicted_classes = np.argmax(predictions, axis=1)

# Load the class labels
class_labels = ['pneumonia', 'lumpy virus', 'blackleg', 'foot and mouth', 'anthrax']

predicted_label = class_labels[predicted_classes[0]]

# Send predictions to stdout
sys.stdout.write(json.dumps({"predictedDisease": predicted_label}))