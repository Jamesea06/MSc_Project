% Clear all variables and objects
clear all;

% Connect to Arduino board
a = arduino("COM7","Uno");

% Define servo motor pin


%motorpin5 = 'D13'; % Pin for Motor 2

% Create servo object



motorLF = servo(a, 'D2'); % Rotation
motorLR = servo(a, 'D3');
motorRR = servo(a, 'D4');
motorRF = servo(a, 'D5'); % Doesn't work


 angle_mL = 0;
 angle_mR = 180;


 writePosition(motorLF, angle_mL/180);
 writePosition(motorLR, angle_mR/180);
 writePosition(motorRR, angle_mL/180);
 writePosition(motorRF, angle_mR/180);


