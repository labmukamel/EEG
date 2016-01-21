
function preProcessing(input_dir, output_dir, config_file)
% for config file :
% filter - should be a vector of two numbers, the 1st is highpass and the
% 2nd is lowpass

current_dir = pwd;
cd(input_dir);
files = dir('*.bdf');
cd(current_dir); 
mkdir(output_dir);

for f = 1:length(files);   % itereate over subjects
    
    %% 1. Read bdf:
    EEG = pop_readbdf([input_dir, files(f).name], [], 73, []);
    EEG = eeg_checkset(EEG);
    filename = strsplit(files(f).name, '.');
    % if save: EEG = pop_saveset(EEG, 'filename',[filename(1) '.set'] ,'filepath',output_dir);
    
    %% 2. Edit channel loacations :
    EEG = editAllLocs(EEG);     % get coordinates for all elcs including externals.
    EEG = eeg_checkset(EEG);
    
    %% 3. Filter data:
    EEG = pop_eegfilt(EEG, filter(1), filter(2), [], 0, 0, 0, 'fir1', 0);
    EEG = eeg_checkset(EEG);
    filename = [filename '_' num2str(filter(1)) '-' num2str(filter(2)) 'flt'];
    % if save: EEG = pop_saveset( EEG, 'filename',[file_name '.set'] ,'filepath',file_path);
    
    %% 4. Re-reference : (Use to run ICA on mastoids)
    EEG = pop_reref(EEG, [69 70]);
    filename = [filename '_M1M2ref'];
    % EEG = pop_saveset( EEG, 'filename',[filename '.set'] ,'filepath',file_path);
    
    %% 5. Edit events values :
    EEG = editEvents_v2(EEG);
    EEG = eeg_checkset(EEG);
    EEG = pop_epoch(EEG, {'105' '106' '107'}, [-2.5 2], 'epochinfo', 'yes');
    EEG = eeg_checkset(EEG);
    filename = [filename '_Epochs'];
    EEG = pop_saveset(EEG, 'filename',[filename '.set'],'filepath',file_path);
    
    %% 6. MANUAL REJECTION OF NOISY EPOCHS
end


