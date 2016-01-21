function params = getParams_start

%% Paramters to generate signal\s:
params.name = 'signal';
params.do_randPhaseShift = 0;
params.do_randAmplitude = 0; % 1 - suppose to influence trialbase 'off'\'full'
params.do_randEpochBase = 0; 
params.do_baseline = 0; % add oscillation baseline
params.do_rmbase = 0; % remove epoch baseline
params.do_extractERSPEpochs = 0; % extract epochs before ersp according to tlimits_ersp
params.add_noise = 0;
params.trialNum = 1;
params.sampling_rate = 1000; % *default
% params.trialNum_phaseShifted = 0.5; % in percents (*default)
% params.trialNum_AmplitudeShifted = 0.5; % in percents (*default)

params.tlimits = [-1000 10000]; % in ms, before and after event onset
params.tlimits_ersp = [-1000 10000];
params.frequency = [10, 10]; % the frequncies changes to inpect (in Hz)
params.phaseShift = [0, 0]'; % in multiples of pi - percent of phase shift (1 - for whole range, 0 - for no shift)
params.amplitude = [1, 1]'; % [0.1 - 2] amplitude of each frequency (in params.frequncy order)
params.baseline.amplitude = [1, 1];  % [0.1 - 2] >1 for ERD\suppression , <1 for ERS\enhancment, 1 - no basline
params.baseline.phaseShift = [0, 0]';
params.baseline.range = NaN; % NaN - for no baseline
params.rmbase.range = [-1000 0]; % 

end