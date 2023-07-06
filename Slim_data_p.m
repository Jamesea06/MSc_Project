clear; % Clear workspace variables
close all; % Close all figures
clc; % Clear command window

dirinfo = dir("*.mat"); % Get information about .mat files in the current directory

if ~exist("Plots", 'dir')
    status = mkdir("Plots"); % Create a directory called "Plots" if it doesn't exist
end

for f = 1:length(dirinfo)
    filename = dirinfo(f).name; % Get the name of the .mat file
    load(filename, "pos", "j", "startingPosition", "ts", "runs","type","i"); % Load data from the .mat file
  
    timeThreshold = 0.2; % Time threshold to ignore at the beginning

    % Find the index of the first occurrence where the joint angle decreases and becomes negative
    for r = 1:runs
        timeIndex = find((ts(r, :) >= timeThreshold), 1);

        % point after is greater than the point before 
        [~, impactIndex] = find((pos(r,timeIndex:end-1) < pos(r,timeIndex+1:end)) & pos(r,timeIndex+1:end) < -0.5, 1); 
        
        impact(f,r) = timeIndex - 1 + impactIndex;

        Imp = impact(f,r);
        tsi(r,:,f) = ts(r, Imp:Imp+25) - ts(r, Imp); % Rezero time data
        
        % Shape analysis for Elastic axis
        Elastic(f,r) = shapeAnalysisFunction(pos(r, Imp:Imp+25));

        Mat_Type(f,r) = type;
        
        Positions(f,r) = i;
        Pretenstion(f,r) = j;

        % Shape analysis for Hardness axis
        diffpos = pos(r, Imp-5:Imp+5);
        difftime = ts(r, Imp-5:Imp+5);
        rateOfChange = (diffpos ./ difftime);

        % Convert to positive values
        positiveRateOfChange = abs(rateOfChange);

        % Find the maximum value
        maxValue = max(positiveRateOfChange);
        Hardness(f,r) = maxValue;
       
    end

end

% Elastic Hardness Plot

% Choose a row index
rowIndex = 1:f;

% Create a color map
colorMap = jet(numel([1,2,3,4,5]));  % Choose a colormap, e.g., 'jet'

% Define the sets of numbers to exchange
numbersToReplace = [-pi/2 0 pi/2];  % Numbers to replace
replacementNumbers = [1 2 3 ];  % Numbers to replace with

% Iterate over each number to be replaced
for i = 1:numel(numbersToReplace)
    % Create a logical mask for the current number
    mask = Pretenstion == numbersToReplace(i);
    
    % Replace the elements using logical indexing
    Pretenstion(mask) = replacementNumbers(i);
end


% Define different marker shapes
markerShapes = {'o', 's', '^', 'd'};  % Add more shapes if needed

% Plot the selected rows
figure
hold on

for f = 1:numel(rowIndex)
    %colorIndex = mod(f-1, size(colorMap, 1)) + 1;  % Cycle through the color map for each index
    colorIndex = Pretenstion(f);
    scatter(Elastic(rowIndex(f), :), Hardness(rowIndex(f), :), [], colorMap(colorIndex, :), markerShapes{Mat_Type(f)})
end
hold off 

xlabel('Elastic (Bounce back, Rad)')
ylabel('Hardness (Rate of change)')
title('Plot of Elastic against Hardness')

% Create a legend with shape and color labels
shapeLabels = {'Circle', 'Square', 'Triangle', 'Diamond'};  % Corresponding shape labels
colorLabels = {'Min', '  0', 'Max'};  % Corresponding color labels

% Add the legend with shape and color labels
legend(colorLabels, 'Location', 'best')
%legend(strcat(shapeLabels), 'Location', 'best')

annotation('textbox', [0.7, 0.1, 0.1, 0.1], 'String', 'Circle(1), Square(2), Triangle(3), Diamond(4)');