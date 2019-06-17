numberOfNotes = 24;

highFrequencies = [293.66,349.23,369.99,392,415.3,440,446.16,523.25, 587.32];

midHighFrequencies = [233.88, 261.63, 293.66,311.13,329.63,349.23,392]

midLowFrequencies = [174.61,185,196,207.65,220,233.88, 261.63,293.66]

lowFrequencies = [98,116.54,130.81,146.83,155.56,164.81,174.61,196,233.88]

testTension = 150;
linearMassDensity = 0.02;
maxLength = 0.4;
stringMass = 0.003
steelLinearMassDensity= stringMass/maxLength;
frequency = highFrequencies
speedAir = 343.5
speedSimpleBar = 2605
thicknessSimpleBar = 0.0127
speedCantileveredBar= 5790
thicknessCantileveredBar= 0.000635
pipeRadius = 0.01905
maxTension = (steelLinearMassDensity*370*10^6)/7700

%% String: Frequency vs Tension
% fprintf("Tension")
% figure
% plot(highFrequencies, tension(highFrequencies,maxLength,steelLinearMassDensity));
% 
% hold on
% 
% plot(midHighFrequencies, tension(midHighFrequencies,maxLength,steelLinearMassDensity));
% 
% hold on
% plot(midLowFrequencies, tension(midLowFrequencies,maxLength,steelLinearMassDensity));
% 
% hold on
% plot(lowFrequencies, tension(lowFrequencies,maxLength,steelLinearMassDensity));
% 
% xlabel('frequency')
% ylabel('tension')
% legend('high','midHigh','midLow','low')
% 

% %% WIND: frequency vs Length
% figure
% plot(highFrequencies,doubleEndPipeLength(highFrequencies,1,speedAir,pipeRadius))
% hold on
% plot(midHighFrequencies,doubleEndPipeLength(midHighFrequencies,1,speedAir,pipeRadius))
% hold on
% plot(midLowFrequencies,doubleEndPipeLength(midLowFrequencies,1,speedAir,pipeRadius))
% hold on
% plot(lowFrequencies,doubleEndPipeLength(lowFrequencies,1,speedAir,pipeRadius))
% 
% xlabel('frequency')
% ylabel('length')
% legend('high','midHigh','midLow','low')

% Simple PERCUSSION: Frequency vs Length
% figure
% plot(highFrequencies,simplySupportedBarLength(highFrequencies,speedSimpleBar,thicknessSimpleBar))
% 
% hold on
% plot(midHighFrequencies,simplySupportedBarLength(midHighFrequencies,speedSimpleBar,thicknessSimpleBar))
% hold on
% plot(midLowFrequencies,simplySupportedBarLength(midLowFrequencies,speedSimpleBar,thicknessSimpleBar))
% hold on
% plot(lowFrequencies,simplySupportedBarLength(lowFrequencies,speedSimpleBar,thicknessSimpleBar))
% 
% xlabel('frequency')
% ylabel('length')
% legend('high','midHigh','midLow','low')

% Cantilevered Percussion : Frequency VS Length
figure
plot(highFrequencies, cantileveredBarLength(highFrequencies,speedCantileveredBar,thicknessCantileveredBar))
hold on
plot(midHighFrequencies, cantileveredBarLength(midHighFrequencies,speedCantileveredBar,thicknessCantileveredBar))
hold on
plot(midLowFrequencies, cantileveredBarLength(midLowFrequencies,speedCantileveredBar,thicknessCantileveredBar))
hold on
plot(lowFrequencies, cantileveredBarLength(lowFrequencies,speedCantileveredBar,thicknessCantileveredBar))
xlabel('frequency')
ylabel('length')
legend('high','midHigh','midLow','low')


function ten = tension(frequency,maxLength,steelLinearMassDensity)
ten = ((2.*frequency.*maxLength).^2).*steelLinearMassDensity
end

function doubleEndPipeLen = doubleEndPipeLength(frequency,mode,speedAir,pipeRadius)
theoreticalLength = (mode*speedAir)./(4.*frequency);
doubleEndPipeLen = theoreticalLength -(2*0.61*pipeRadius);
end

function simplySupportedLength = simplySupportedBarLength(frequency,speedBar,thickness)
k = thickness/3.46;
simplySupportedLength = sqrt(((3.0112^2) * pi * k * speedBar)./(8.*frequency));
end

function cantileveredLength = cantileveredBarLength(frequency,speedBar,thickness)
k = thickness/3.46;
cantileveredLength = sqrt(((1.194^2) * pi * k * speedBar)./(8.*frequency));
end