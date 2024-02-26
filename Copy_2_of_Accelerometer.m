clear all;
% Connect to Arduino board
a = arduino('COM7', 'Uno');

%bno = bno055(a,'SamplesPerRead',1,'OutputFormat','matrix','OperatingMode','ndof');

% Define servo motor pin
motorLF = 'D9';% Pin for Motor 1
motorLR = 'D10'; % Pin for Motor 2
motorRR = 'D11'; % Pin for Motor 2
motorRF = 'D12'; % Pin for Motor 2

 angle_m1 = 100; 
 angle_m2 = 100;

 angle_m4 = 80;
 writePosition(motorLF, angle_m1/180);
 writePosition(motorLR, angle_m2/180);

 writePosition(motorRF, angle_m4/180);



%[accelReadings, gyroReadings, magReadings, orientationReadings,timeStamps, overrun] = read(bno)

numSamples = 20;
runs = 20;

Angle = zeros(numSamples, 2,runs);

fprintf('Start');

% Walking setup


% Create servo object

motorRR = servo(a, motorRR);

 angle_m3 = 180;
 writePosition(motorRR, angle_m3/180);


pause(1)



for r = 1:runs

tStart = tic;           % pair 2: tic
T = zeros(1,numSamples);

 angle_m3 = 80;
 writePosition(motorRR, angle_m3/180);


% Record data over time
for i = 1:numSamples
    % Read data from the sensor
    %[accelReadings, orientationReadings, overrun] = read(bno);
    tic
    %Accel(i,:,r) = accelReadings;
    %positon(i,:,r) = orientationReadings;
    Angle(i,1,r) = readVoltage(a, 'A0');
    Angle(i,2,r) = readVoltage(a, 'A1'); 

    % Get the current time
    T(i)= toc;
       
    % Pause for a short duration before the next reading
    pause(0.05); % You can adjust the duration as needed
end


 pause(1)

 angle_m3 = 180;
 writePosition(motorRR, angle_m3/180);

 pause(1)



end


Ti(:,:,r)=T;



T = reshape(Ti, [], 1);
%Accel = reshape(Accel, [], 3);
%positon = reshape(positon, [], 3);
Angle = reshape(Angle,[],2);


% Plot the accelerometer data over time
figure;

% Time vector for plotting
timeVector = cumsum(T);

figure;
plot(timeVector, Angle(:, 1), 'b', 'LineWidth', 2);  % Plot the first line in blue
hold on;  % Add 'hold on' to keep the first plot and add the second one
plot(timeVector, Angle(:, 2), 'r', 'LineWidth', 2);  % Plot the second line in red
hold off;  % Release the 'hold on' mode

xlabel('Reading Number');
ylabel('Potentiometer Voltage (V)');
title('Potentiometer Readings');
grid on;
