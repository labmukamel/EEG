%% plotAnalysis
clear all; close all; clc;
%eeglab;

%% Get parameters for generating the signal:
params = getParams_start;

%% what to analyze:
doSpectrum = 0;
doERSP = 1;
doITC = 0;
doCoherence = 0;


%% Generate the Signal : 
%% random phase shift
if params.do_randPhaseShift
    params.phaseShift = params.phaseShift * [0:0.01:2*pi]; % random shift in range
end
%% random osciallation power
if params.do_randAmplitude
    params.amplitude = params.amplitude * [0:0.01:1]; % random amplitude in a range
end
%% random epoch baseline:
params.epochBase.amplitude = -10:10;
%% osciallation basline
if params.do_baseline
    baselinesMat = repmat(params.baseline.amplitude', 1, size(params.amplitude,2));
    params.baseline.amplitude = baselinesMat .* params.amplitude;
end
%% add white noise
if params.add_noise
    params.noise.power = 100;
end


%% Do Simulation:
if ~doCoherence
    signal = generateSignal(params);
    if doSpectrum; spectrum(signal, params); end
    if doERSP; ersp(signal, params); end
    if doITC; itc(signal, params); end

elseif doCoherence
    % signal 1:
    params.name = 'signal1';
    params.frequency = [10 10]; % in Hz
    params.phaseShift = [0 0]'; % multiplies of pi
    params.amplitude = [1 1]';
    s1 = generateSignal(params);
    % signal 2:
    params.name = 'signal2';
    params.frequency = [10 10]; % in Hz
    params.phaseShift = [pi pi]'; % in radians - multiplies of pi
    params.amplitude = [1 1]';
    s2 = generateSignal(params);
    coherence(s1, s2,params);
end


