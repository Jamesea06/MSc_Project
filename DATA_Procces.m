clear; % Clear workspace variables
close all; % Close all figures
clc; % Clear command window

% Test text, see if this works

dirinfo = dir("*.mat"); % Get information about .mat files in the current directory

if ~exist("Plots", 'dir')
    status = mkdir("Plots"); % Create a directory called "Plots" if it doesn't exist
end

for f = 1:length(dirinfo)
    filename = dirinfo(f).name; % Get the name of the .mat file
    load(filename, "pos", "j", "startingPosition", "ts", "runs","type","i"); % Load data from the .mat file
    
%     % Plot experiment group:
%     figname = "Plots/Test" + f + ".png"; % Define the filename for the figure
%     % Plot whole data (Figure take long computational time)
%     figure('Visible','off') 
%     for j = 1:20
%         hold on
%         plot(ts(j,:), pos(j,:)) % Plot the joint angle over time
%         ylim([-pi/2 pi/2]) % Set the y-axis limits
%     end
%     hold off
%     title('Joint response') % Set the title of the figure
%     xlabel('Time [s]') % Set the x-axis label
%     ylabel('Joint angle [rad]') % Set the y-axis label
%     saveas(gcf, figname) % Save the figure as a PNG image

    
    timeThreshold = 0.2; % Time threshold to ignore at the beginning

    % Find the index of the first occurrence where the joint angle decreases and becomes negative
    for r = 1:runs
        timeIndex = find((ts(r, :) >= timeThreshold), 1);
        %[~, impactIndex] = min(pos(r, timeIndex:end)); % Find the minimum value after the time threshold
        %impact(f, r) = timeIndex - 1 + impactIndex;
        
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

%     % Impact Location: 
%     figure ('Visible','on') 
%     hold on
%     ylim([-pi/2, pi/2])
%     xlim([0, 2])
%     for row = 1:size(tsi, 1)
%         plot(ts(row, impact(f,row)-5:impact(f,row)+5), pos(row, impact(f, row)-5:impact(f, row)+5))
%     end
%     hold off
    
%     % Impact plots:
%     figname = "Plots/Impact_Tets" + f + ".png"; % Define the filename for the figure
%     figure ('Visible','off') 
%     hold on
%     ylim([-pi/2, pi/2])
    
%    for row = 1:size(tsi, 1)
%         plot(tsi(row, :, f), pos(row, impact(f, row):impact(f, row)+25))
%     end
%     hold off
%     title('Impact response') % Set the title of the figure
%     xlabel('Time [s]') % Set the x-axis label
%     ylabel('Joint angle [rad]') % Set the y-axis label
%     saveas(gcf, figname) % Save the figure as a PNG image
%    end

end

% Elastic Hardness Plot

% Choose a row index
rowIndex = 1:f;

% Create a color map
colorMap = jet(numel([1,2,3,4,5]));  % Choose a colormap, e.g., 'jet'

% Define the sets of numbers to exchange
numbersToReplace = [-pi/6 -pi/4 -pi/2 0 pi/6];  % Numbers to replace
replacementNumbers = [1 2 3 4 5];  % Numbers to replace with

% Iterate over each number to be replaced
for i = 1:numel(numbersToReplace)
    % Create a logical mask for the current number
    mask = Positions == numbersToReplace(i);
    
    % Replace the elements using logical indexing
    Positions(mask) = replacementNumbers(i);
end


% Define different marker shapes
markerShapes = {'o', 's', '^', 'd'};  % Add more shapes if needed

% Plot the selected rows
figure
hold on

for f = 1:numel(rowIndex)
    %colorIndex = mod(f-1, size(colorMap, 1)) + 1;  % Cycle through the color map for each index
    colorIndex = Positions(f);
    scatter(Elastic(rowIndex(f), :), Hardness(rowIndex(f), :), [], colorMap(colorIndex, :), markerShapes{Mat_Type(f)})
end
hold off 

xlabel('Elastic (Bounce back, Rad)')
ylabel('Hardness (Rate of change)')
title('Plot of Elastic against Hardness')

% Create a legend with shape and color labels
shapeLabels = {'Circle', 'Square', 'Triangle', 'Diamond'};  % Corresponding shape labels
colorLabels = {'-pi/6', '-pi/4', '-pi/2', ' pi/6', '  0'};  % Corresponding color labels

% Add the legend with shape and color labels
legend(colorLabels, 'Location', 'best')
%legend(strcat(shapeLabels), 'Location', 'best')

annotation('textbox', [0.7, 0.1, 0.1, 0.1], 'String', 'Circle(1), Square(2), Triangle(3), Diamond(4)');
