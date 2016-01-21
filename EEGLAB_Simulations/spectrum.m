function spectrum(signal, params)

srate   = params.sampling_rate;
frames  = size(signal,2);
freq_range = [0 50];


figure;
spectopo(signal, frames, srate, ...
         'freqrange', freq_range);
    