clear all;
% Connect to Arduino board
a = arduino('COM7', 'Uno');

%bno = bno055(a,'SamplesPerRead',1,'OutputFormat','matrix','OperatingMode','ndof');

% Define servo motor pin
motorLF = 'D9';% Pin for Motor 1
motorLR = 'D10'; % Pin for Motor 2
motorRR = 'D11'; % Pin for Motor 2
motorRF = 'D12'; % Pin for Motor 2




%[accelReadings, gyroReadings, magReadings, orientationReadings,timeStamps, overrun] = read(bno)

numSamples = 140;
runs = 5;
Accel = zeros(numSamples,3,runs);
positon = zeros(numSamples,3,runs);
Angle = zeros(numSamples, 2,runs);

fprintf('Start');

% Walking setup


% Create servo object
motorLF = servo(a, motorLF);
motorLR = servo(a, motorLR);
motorRR = servo(a, motorRR);
motorRF = servo(a, motorRF);
 angle_m1 = 100; 
 angle_m2 = 100;
 angle_m3 = 80;
 angle_m4 = 80;
 writePosition(motorLF, angle_m1/180);
 writePosition(motorLR, angle_m2/180);
 writePosition(motorRR, angle_m3/180);
 writePosition(motorRF, angle_m4/180);


for r = 1:runs

tStart = tic;           % pair 2: tic
T = zeros(1,numSamples);

% Record data over time
for i = 1:numSamples/7*1
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

% Set servo position
 angle_m1 = 100; 
 angle_m2 = 90;
 angle_m3 = 90;
 angle_m4 = 80;
 writePosition(motorLF, angle_m1/180);
 writePosition(motorLR, angle_m2/180);
 writePosition(motorRR, angle_m3/180);
 writePosition(motorRF, angle_m4/180);


for i = numSamples/7*1+1:numSamples/7*2

 % Read data from the sensor
    %[accelReadings, gyroReadings, magReadings, orientationReadings,timeStamps, overrun] = read(bno);
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

% Set servo position
 angle_m3 = 60; 
 writePosition(motorRR, angle_m3/180);

for i = numSamples/7*2+1:numSamples/7*3

 % Read data from the sensor
    %[accelReadings, gyroReadings, magReadings, orientationReadings,timeStamps, overrun] = read(bno);
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


 angle_m3 = 50; 
 writePosition(motorRF, angle_m3/180);

   % Set servo position
 angle_m3 = 110; 
 writePosition(motorLR, angle_m3/180)

  angle_m1 = 135; 
 writePosition(motorLF, angle_m1/180);


for i = numSamples/7*3+1:numSamples/7*4

 % Read data from the sensor
    %[accelReadings, gyroReadings, magReadings, orientationReadings,timeStamps, overrun] = read(bno);
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

% Set servo position
 angle_m1 = 100; 
 angle_m2 = 90;
 angle_m3 = 90;
 angle_m4 = 80;
 writePosition(motorLF, angle_m1/180);
 writePosition(motorLR, angle_m2/180);
 writePosition(motorRR, angle_m3/180);
 writePosition(motorRF, angle_m4/180);

for i = numSamples/7*4+1:numSamples/7*5

 % Read data from the sensor
    %[accelReadings, gyroReadings, magReadings, orientationReadings,timeStamps, overrun] = read(bno);
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


% Set servo position
 angle_m3 = 60; 
 writePosition(motorRR, angle_m3/180);



for i = numSamples/7*5+1:numSamples/7*6

 % Read data from the sensor
    %[accelReadings, gyroReadings, magReadings, orientationReadings,timeStamps, overrun] = read(bno);
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


 angle_m3 = 50; 
 writePosition(motorRF, angle_m3/180);

   % Set servo position
 angle_m3 = 110; 
 writePosition(motorLR, angle_m3/180)

  angle_m1 = 135; 
 writePosition(motorLF, angle_m1/180);


for i = numSamples/7*6+1:numSamples

 % Read data from the sensor
    %[accelReadings, gyroReadings, magReadings, orientationReadings,timeStamps, overrun] = read(bno);
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


Ti(:,:,r)=T;

end


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
