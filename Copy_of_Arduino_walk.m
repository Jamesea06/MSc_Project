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

SmotorLF = servo(a, 'D2'); % Lef back
SmotorLR = servo(a, 'D3');
SmotorRR = servo(a, 'D4');
SmotorRF = servo(a, 'D5'); % Doesn't work

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
for c = 1 : 8
 pause(1)
 writePosition(SmotorLF, 0/180)
 writePosition(SmotorRR, 0/180)
 pause(1)
 angle_m1 = 140; 
 angle_m2 = 115;
 angle_m3 = 65;
 angle_m4 = 40;
 writePosition(motorLF, angle_m1/180);
 writePosition(motorLR, angle_m2/180);
 writePosition(motorRR, angle_m3/180);
 writePosition(motorRF, angle_m4/180);

 pause(0.2)

 angle_m1 = 100; 
 angle_m2 = 100;
 angle_m3 = 80;
 angle_m4 = 80;
 writePosition(motorLF, angle_m1/180);
 writePosition(motorLR, angle_m2/180);
 writePosition(motorRR, angle_m3/180);
 writePosition(motorRF, angle_m4/180);

 writePosition(SmotorLF, 90/180)
 writePosition(SmotorRR, 90/180)

end 
