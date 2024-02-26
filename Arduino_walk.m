    % Clear all variables and objects
clear all;

% Connect to Arduino board
a = arduino("COM7","Uno");
potentiometerPin = 'A0';
% Number of readings to store
numReadings = 100;

% Initialize an empty matrix to store the potentiometer values
potValues = zeros(numReadings, 1);

% Define servo motor pin
motorLF = 'D9';% Pin for Motor 1
motorLR = 'D10'; % Pin for Motor 2
motorRR = 'D11'; % Pin for Motor 2
motorRF = 'D12'; % Pin for Motor 2

% Create servo object
motorLF = servo(a, motorLF);
motorLR = servo(a, motorLR);
motorRR = servo(a, motorRR);
motorRF = servo(a, motorRF);
potValues(:) = readVoltage(a, potentiometerPin);
 angle_m1 = 100; 
 angle_m2 = 100;
 angle_m3 = 80;
 angle_m4 = 80;
 writePosition(motorLF, angle_m1/180);
 writePosition(motorLR, angle_m2/180);
 writePosition(motorRR, angle_m3/180);
 writePosition(motorRF, angle_m4/180);
potValues(:) = readVoltage(a, potentiometerPin);
for c = 1 : 8
potValues(:) = readVoltage(a, potentiometerPin);
pause(1)    
% Set servo position
 angle_m1 = 90; 
 angle_m2 = 90;
 angle_m3 = 90;
 angle_m4 = 90;
 writePosition(motorLF, angle_m1/180);
 writePosition(motorLR, angle_m2/180);
 writePosition(motorRR, angle_m3/180);
 writePosition(motorRF, angle_m4/180);
potValues(:) = readVoltage(a, potentiometerPin);
pause(1)

  % Set servo position
 angle_m3 = 60; 
 writePosition(motorRR, angle_m3/180);
potValues(:) = readVoltage(a, potentiometerPin);

 pause(1)
  % Set servo position
 angle_m3 = 110; 
 writePosition(motorLR, angle_m3/180);
potValues(:) = readVoltage(a, potentiometerPin);

 pause(1)
% Set servo position
 angle_m1 = 119; 
 writePosition(motorLF, angle_m1/180);
  pause(1);

 potValues(:) = readVoltage(a, potentiometerPin);
% Set servo position
 angle_m3 = 65; 
 writePosition(motorRF, angle_m3/180);
 potValues(:) = readVoltage(a, potentiometerPin);
pause(1);
 angle_m1 = 100; 
 angle_m2 = 100;
 angle_m3 = 80;
 angle_m4 = 80;
 writePosition(motorLF, angle_m1/180);
 writePosition(motorLR, angle_m2/180);
 writePosition(motorRR, angle_m3/180);
 writePosition(motorRF, angle_m4/180);
potValues(:) = readVoltage(a, potentiometerPin);
% 

end 
