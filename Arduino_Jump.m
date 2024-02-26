% Clear all variables and objects
clear all;

% Connect to Arduino board
a = arduino("COM7","Uno");

% Define servo motor pin
motorLF = 'D9';% Pin for Motor 1
motorLR = 'D10'; % Pin for Motor 2
motorRR = 'D11'; % Pin for Motor 2
motorRF = 'D12'; % Pin for Motor 2

SmotorLF = servo(a, 'D2'); % Rotation
SmotorLR = servo(a, 'D3');
SmotorRR = servo(a, 'D4');
SmotorRF = servo(a, 'D5'); % Doesn't work

% Create servo object
motor1 = servo(a, motorLF);
motor2 = servo(a, motorLR);
motor3 = servo(a, motorRR);
motor4 = servo(a, motorRF);

for c = 1 : 1

pause(2)    
% Set servo position
 angle_m1 = 0; 
 angle_m2 = 0;
 angle_m3 = 180;
 angle_m4 = 180;
 writePosition(motor1, angle_m1/180);
 writePosition(motor2, angle_m2/180);
 writePosition(motor3, angle_m3/180);
 writePosition(motor4, angle_m4/180);

 pause(2)

%  angle_m5 = 0;
%  writePosition(motor5, angle_m5/180);

% Wait for servo movement
pause(2);  % Adjust as needed

% Set servo position
 angle_m1 = 180; 
 angle_m2 = 180;
 angle_m3 = 0;
 angle_m4 = 0;
 writePosition(motor1, angle_m1/180);
 writePosition(motor2, angle_m2/180);
 writePosition(motor3, angle_m3/180);
 writePosition(motor4, angle_m4/180);

 pause(2);  % Adjust as needed
end 
% % Specify the angles for back and forth movement
% angle1 = 0;  % Start position (0 degrees)
% angle2 = 180;  % End position (180 degrees)
% 
% % Specify the delay between movements (in seconds)
% delay = 2;
% 
% % Define the frequency and duration of the movement
% frequency = 1;  % Frequency of the oscillation in Hz
% movementDuration = 10;  % Total duration of the movement in seconds
% 
% % Calculate the time step and the angular velocity
% timeStep = 1 / (frequency * 80);  % Time step for each iteration
% angularVelocity = 10 * pi * frequency;  % Angular velocity in radians per second
% 
% % Calculate the amplitude and the phase shift
% amplitude = (angle2 - angle1) / 2;  % Amplitude of the oscillation
% phaseShift = pi / 2;  % Phase shift of the oscillation
% 
% % Calculate the total number of steps
% numSteps = (movementDuration / timeStep);
% 
% % Move servo 1 back and forth smoothly
% for step = 1:numSteps
%     % Calculate the current time
%     currentTime = (step - 1) * timeStep;
%     
%     % Calculate the desired angle based on the sine wave
%     desiredAngle = angle1 + amplitude * sin(angularVelocity * currentTime + phaseShift);
%     
%     % Convert the desired angle to the position value (0 to 1)
%     positionValue = (desiredAngle/180 + 1) / 2;
%     
%     % Move servo 1 to the desired position
%     writePosition(motor1, positionValue);
%     % Move servo 2 to the desired position
%     writePosition(motor2, 1-positionValue);
%     % Move servo 3 to the desired position
%     writePosition(motor3, 1-positionValue);
%     % Move servo 4 to the desired position
%     writePosition(motor4, positionValue);
%     
%     % Pause between steps
%     pause(timeStep);
% end
% 
% 
% % Disconnect from Arduino
% clear arduino();
