function signal = generateSignal(params)
% Simulating ERSP
% Inputs:
% epochs: in sec

w = 0:1/params.sampling_rate:diff(params.tlimits)/params.sampling_rate;
signal = zeros(params.trialNum, size(w,2));
for t = 1:params.trialNum
    %% Generate noise:
    if params.add_noise
        params.noise.signal = randn(1,size(w,2)).*params.noise.power;
    else
        params.noise.signal = zeros(1,size(w,2));
    end
    %% Generate the Signal:
    signal(t,:) = generateSinWave(params, w);
    if params.do_randEpochBase
        signal(t,:) = addEpochBase(signal(t,:), params);
    end
    %% Plot the signal to be analyzed: 
    time = params.tlimits(1):params.tlimits(2);
    plot(time,signal(t,:), 'color', [rand, rand, rand]);
    hold on
end
save([params.name '.mat'], 'signal', 'params')
end


function signal = generateSinWave(params, w)
signal = zeros(1, size(w,2));
for f = 1 : size(params.frequency,2)
    amplitude = params.amplitude(f); % choose random amp - ceil(size(params.amplitude,2).*rand(1,1))); 
    phaseShift = params.phaseShift(f); % same -  ceil(size(params.phaseShift,2).*rand(1,1)));
    signal = signal + amplitude*sin(params.frequency(f)*2*pi*w - phaseShift*ones(1,size(w,2)))...
        + params.noise.signal;
    if params.do_baseline 
        signal = addBaseline(signal,params,amplitude,f);
    end
end
end


function signal = addBaseline(signal, params, amplitude,f)
tlimits = params.tlimits(1):params.tlimits(2);
range_idx = find(params.baseline.range(1) == tlimits): ...
            find(params.baseline.range(2) == tlimits);
baseline_amplitude = params.baseline.amplitude(f, ceil(size(params.baseline.amplitude,2).*rand(1,1))); 
baseline_phase = params.baseline.phaseShift(f,ceil(size(params.baseline.phaseShift,2).*rand(1,1)));
signal(range_idx) = signal(range_idx)*baseline_amplitude/amplitude + ...
    baseline_phase*rand(1,length(range_idx));    
end


function signal = addEpochBase(signal, params)
amplitude = params.epochBase.amplitude(ceil(size(params.epochBase.amplitude,2).*rand(1,1)));
signal = signal + amplitude;
end