function ersp(signal, params)

if nargin<1
    load('signal', 'signal');
end
if params.do_rmbase
    tlimits = params.tlimits(1):params.tlimits(2);
    range = find(params.rmbase.range(1) == tlimits): ...
                find(params.rmbase.range(2) == tlimits);
    signal = rmbase(signal, size(signal,2), range);
    plot(signal(1,:),'blue');
    plot(signal(2,:),'red');
end

if params.do_extractERSPEpochs
    tlimits = params.tlimits(1):params.tlimits(2);
    if ~all(params.tlimits == params.tlimits_ersp)
        range = find(params.tlimits_ersp(1) == tlimits): ...
                find(params.tlimits_ersp(2) == tlimits);
        signal = signal(:,range);  % extract new epochs
%         windo=hanning(length(signal));
%         signal=signal.*windo';
    end 
end

tlimits = params.tlimits_ersp; % in msec
cycles  = [9 0.5];
srate   = params.sampling_rate;
frames  = size(signal,2);
freqsin = [3 30]; % frequency range 
freqsteps = 5; % steps each freqency 
baseline_type = 'baseline';
baseline_range = params.baseline.range;
padratio = 16;

figure;
ersp = newtimef(signal, frames, tlimits, srate, cycles)...
%     'freqs', freqsin, ...
%     'plotersp', 'on', ...
%     'plotitc', 'off', ...
%     'timesout', 200, ... % how many points in time to get the power and phase - / not clear...
%     'trialbase', 'on', ...
%     'newfig', 'off', ...
%     'verbose','on', ...
%     'marktimes',(2000),...
%     baseline_type, baseline_range, ...
%     'alpha', 0.01 ); 
%     %'nfreqs', freqsteps*(freqsin(2) - freqsin(1)), ...;
%      % 'padratio', padratio, ...   % this is the 2-4 padding
end


% try change :
% padratio - ?
% baslines types
% ploting
% time wraping
% 