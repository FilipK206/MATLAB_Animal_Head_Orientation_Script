# Project Title: Animal Head Orientation Analysis

![lab_picture](https://github.com/FilipK206/MATLAB_Animal_Head_Orientation_Script/assets/109867923/70a90b5c-8133-4727-af9c-d80a39b8403d)


## Description

This project aims to analyze the orientation of an animal's head relative to a fixed point in space, typically a light source. The MATLAB script processes coordinate data stored in the file "HeadNoseXYP.mat" and calculates the angles between the animal's head and the light source.

## Key Features

- Imports coordinate data from the file "HeadNoseXYP.mat".
- Defines parameters such as the coordinates of the light source.
- Uses linear interpolation to improve accuracy when necessary, especially for coordinates with low certainty.
- Calculates the angles between the animal's head and the light source using trigonometry.
- Generates a plot showing the variation of angles over the recorded frames.

## Instructions

1. Ensure that the MATLAB environment is set up.
2. Place the "HeadNoseXYP.mat" file containing the coordinate data in the same directory as the script.
3. Run the MATLAB script.
4. View the generated plot to observe the animal's head orientation relative to the light source over time.

## Function

- `linearInterpolate`: Performs linear interpolation between neighboring coordinates to improve accuracy, especially for points with low certainty.

## Dependencies

- MATLAB environment.

## Note

- Ensure that the coordinate data in the "HeadNoseXYP.mat" file is properly formatted and contains the required fields for accurate analysis.
