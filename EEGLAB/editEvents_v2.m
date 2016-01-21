
function EEG = editEvents_v2(EEG, checkIfCorrect)
% checkIfCorrect = 0 or 1


for evt = 1:size(EEG.event,2);
    if strcmp(EEG.event(1,evt).type,'boundary')
        EEG.event(1,evt).type = 999;
    end
    if ischar(EEG.event(1,evt).type)
        EEG.event(1,evt).type = str2num(EEG.event(1,evt).type);
    end
end


for evt = 1:size(EEG.event,2)-3;
    cfsEvent = EEG.event(1,evt).type == [11 12 13]; 
    if cfsEvent 
        actImage = EEG.event(1,evt+1).type == [21 22 23 24];
        correct_report = responseMap(cfsEvent, actImage);
        if checkIfCorrect
            if correct_report == EEG.event(1,evt+2).type;
                EEG.event(1,evt).type = EEG.event(1,evt).type*10+1;
            else
                EEG.event(1,evt).type = EEG.event(1,evt).type*10+0;
            end
        end
        EEG.event(1,evt).type = EEG.event(1,evt).type*10 + ...
            EEG.event(1,evt+3).type;
    end
end