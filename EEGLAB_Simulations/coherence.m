function coherence(s1, s2, params)

cycles  = [3 0.5];
srate   = params.sampling_rate;
tlimits = params.tlimits; % in msec
frames  = size(s1,2);
baseline_type = 'baseline';
baseline_range = 0;
padratio = 16;
type = 'phasecoher';  % 'coher'|'phasecoher'|'amp' 
subitc = 'off';

% if length(size(s1))>2
%     s1 = double(s1);
%     s2 = double(s2);
%     s1 = reshape(s1, size(s1,2), size(s1,3));
%     s2 = reshape(s2, size(s2,2), size(s2,3));
% end
%     
s1 = s1';
s2 = s2';
s1 = reshape(s1,1,size(s1,1)*size(s1,2));
s2 = reshape(s2,1,size(s2,1)*size(s2,2));
check_frames = size(s1,2) == size(s2,2);
if ~check_frames
    error('size of signals is not equal');
end

% figure;
% crossf(s1',s2',frames,tlimits,srate,cycles,...
%     'padratio', padratio, ...
%     'alpha', 0.01, ...
%     'type', type, ...
%     'subitc', subitc, ...
%     baseline_type, baseline_range);

% figure; 
% pop_newcrossf( EEG, 1, 13, 27, [-4000  1996], ...
%     [3         0.5] ,'type', 'phasecoher', 'topovec', ...
%     [13  27], 'elocs', EEG.chanlocs, 'chaninfo', ...
%     EEG.chaninfo, 'title','Channel C3-O1 Phase Coherence', ...
%     'alpha',0.01,'padratio', 1);

figure; 
newcrossf(s1', s2', frames, tlimits, srate, cycles, ...
    'type', type, ...
    'padratio', 1, ...
    'subitc', subitc);



end

%% test parameters when:
% constant amplitude and phase
% constant amplitude, shifted phase
% constant phase, different amplitude

% to harminic and not harmonuc frequencies

%% test function optional inputs:
% 'type'  = ['coher'|'phasecoher']
% 'subitc' = ['on'|'off']
% 'baseline'
% 'powbase'

%% test parameters:
% padratio


%% RESULTS:
%% 1 freq signal:
%% Phase shifts, constant amplitude:
% - 0: 1 coherence, 0 degress
% - pi/2(90) shifts: ~0.75 coherence, ~70 degrees NOT 90!!! 
% - pi (antiphase): 0 coherence, 0 degress NOT 180!!!
%% Amplitude changes, constant phase:
% [1 10] - 1 coherence, 0 degress
% [1 0.1] - same, less coh freqs artifacts.
%% Amplitude changes + Phase shifts:
% [1 10], pi/2 phase: 0.75 coherence but with patchs time courses 
% [1 0.1], pi/2: 0.75 coherence with smoother patches.
% [1 0.1], pi: 0 coherence

%% %% 1 freq signal (type, 'coher'): (default is 'phasecor') - use 'phasecor'
%% Phase shifts, constant amplitude:
% phase shift dont impact coherence only phase in 'phasecoher' type 
% - pi (antiphase): 0 coherence, changing degress over time (not clear)

%% 1 freq signal (subitc, 'on'): (defualt is 'off') - more messy, don't use

%% each signal with different freq (harmonic)
%% constant Phase shifts, constant amplitude:
% [10, 20] - ~1 coherence in ~13, ~15 freqs. degrees chagnging in steps 
% [10, 40] - 0
% [10, 20] pi/2(90) shifts: ~0.75 coherence, degrees chagnging in steps 
% the rest preety much the same


%% padratio:
% replace nfreqs (/freqs steps) - the higher the paration rhe higher the
% resolution (16 is good)


%% Conclusions:
% USE CROSSF AND NOT NEWCROSSF
% 1. phase shift and diff amps don't impact the coherence.
%     the coherence will be high as long as autocorrelation and\or phase is
%     consistent (?)
% 2. when comparing amplitudes - better normalize the higher to 1 and the
%    lower to 0-1.
% 3. when signal cointains many frequencies their will be higher coherences
%    between closer freqs no matter if they are harmonic or not. 


