function itc(signal,params)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

if nargin<1
    load('signal', 'signal');
end

cycles  = [3 0.5];
srate   = params.sampling_rate;
tlimits = params.tlimits; % in msec
frames  = size(signal,2);
freqsin = [4 50]; % frequency range 
freqsteps = 1; % steps each freqency 
baseline_type = 'baseline';
baseline_range = [tlimits(1) 0];
padratio = 64;
 
figure;
newtimef(signal', frames, tlimits, srate, cycles,...
    'freqs', freqsin, ...
    'plotersp', 'off', ...
    'plotitc', 'on', ...
    'padratio', padratio, ...   % this is the 2-4 padding
    'timesout', 200, ... % how many points in time to get the power and phase - / not clear...
    'nfreqs', freqsteps*(freqsin(2) - freqsin(1)), ...
    'newfig', 'off', ...
    'verbose','on', ...
    'marktimes',(2000),...
    baseline_type, baseline_range, ...
    'alpha', 0.05 );
end


% test phase shifts

