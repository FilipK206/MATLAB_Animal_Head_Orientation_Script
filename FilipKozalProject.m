% Orientation of the animal's head relative to a specific point in space
clc, clearvars, close all

% imports data
data = importdata('HeadNoseXYP.mat');

% parameters
light_coordinates = [200, 250];
all_angles = zeros(length(data), 1);

% actions
for i = 1:length(data)
    if data(i, 3) >= 0.7 && data(i, 6) >= 0.7
        % coords
        head_x = data(i, 1);
        head_y = data(i, 2);

        nose_x = data(i, 4);
        nose_y = data(i, 5);
    else
        % linear interpolation for head coordinates
        if data(i, 3) < 0.7
            [head_x, head_y] = linearInterpolate(data(:, 3), data(:, 1:2), i);
        else
            head_x = data(i, 1);
            head_y = data(i, 2);
        end

        % linear interpolation for nose coordinates
        if data(i, 6) < 0.7
            [nose_x, nose_y] = linearInterpolate(data(:, 6), data(:, 4:5), i);
        else
            nose_x = data(i, 4);
            nose_y = data(i, 5);
        end
    end
    % vectors
    AB = [nose_x - head_x, nose_y - head_y];
    AC = light_coordinates - [head_x, head_y];

    % calculates the angle based on vectors
    angle = atan2d(AB(1)*AC(2) - AB(2)*AC(1), AB(1)*AC(1) + AB(2)*AC(2));

    % saves each angle to the matrix
    all_angles(i) = angle;
end

% makes plot
plot(1:length(data), all_angles, 'b')
xlabel('Frame')
ylabel('Angle (degrees)')
title('Animal Head Orientation Relative to Light Source')

% linear interpolation function
function [x, y] = linearInterpolate(certainty, coords, i)
    lower_neighbour = i;
    higher_neighbour = i;

    % looks for the nearest neighbour with high certainty
    while lower_neighbour > 1 && certainty(lower_neighbour, 1) < 0.7
        lower_neighbour = lower_neighbour - 1;
    end

    % looks for the nearest neighbour with high certainty
    while higher_neighbour < length(coords) && certainty(higher_neighbour, 1) < 0.7
        higher_neighbour = higher_neighbour + 1;
    end

    x = (coords(lower_neighbour, 1) + coords(higher_neighbour, 1)) / 2;
    y = coords(lower_neighbour, 2) + (coords(higher_neighbour, 2) - coords(lower_neighbour, 2)) / ...
        (coords(higher_neighbour, 1) - coords(lower_neighbour, 1)) * (x - coords(lower_neighbour, 1));
end
