function EEG = editAllLocs(EEG)
elp_file = ['C:\\toolbox\\eeglab12_0_1_0b\\plugins\\' ... 
            'dipfit2.2\\standard_BESA\\standard-10-5-cap385.elp'];
EEG = pop_chanedit(EEG, 'lookup', elp_file, ...
      'changefield', {65 'labels' 'L_HEOG'}, ...
      'changefield', {65 'theta' '-35.892'}, ...
      'changefield', {65 'radius' '0.52233'}, ...
      'changefield', {65 'X' '68.6911'}, ...
      'changefield', {65 'Y' '56'}, ...
      'changefield', {65 'Z' '-50'}, ...
      'changefield', {65 'sph_theta' '35.892'}, ...
      'changefield', {65 'sph_phi' '-4.02'}, ...
      'changefield', {65 'sph_radius' '85'}, ...
      'changefield', {66 'theta' '-35.892'}, ...
      'changefield', {66 'radius' '0.52233'}, ...
      'changefield', {66 'X' '68.6911'}, ...
      'changefield', {66 'Y' '-56'}, ...
      'changefield', {66 'Z' '-50'}, ...
      'changefield', {66 'sph_theta' '35.892'}, ...
      'changefield', {66 'sph_phi' '-4.02'}, ...
      'changefield', {66 'sph_radius' '85'}, ...
      'changefield', {66 'labels' 'R_HEOG'}, ...
      'changefield', {67 'labels' 'L_VEOG'}, ...
      'changefield', {67 'theta' '-35.892'}, ...
      'changefield', {67 'radius' '0.52233'}, ...
      'changefield', {67 'X' '80'}, ...
      'changefield', {67 'Y' '-38'}, ...
      'changefield', {67 'Z' '-68'}, ...
      'changefield', {67 'sph_theta' '35.892'}, ...
      'changefield', {67 'sph_phi' '-4.02'}, ...
      'changefield', {67 'sph_radius' '85'}, ...
      'changefield', {69 'labels' 'ML'}, ...
      'changefield', {69 'theta' '-100'}, ...
      'changefield', {69 'radius' '0.66022'}, ...
      'changefield', {69 'X' '-35'}, ... 
      'changefield', {69 'Y' '80'}, ...
      'changefield', {69 'Z' '-90'}, ...
      'changefield', {69 'sph_theta' '100'}, ...
      'changefield', {69 'sph_phi' '-28.84'}, ...
      'changefield', {69 'sph_radius' '85'}, ...
      'changefield', {70 'labels' 'MR'}, ...
      'changefield', {70 'theta' '100'}, ...
      'changefield', {70 'radius' '0.66022'}, ...
      'changefield', {70 'X' '-35'}, ...
      'changefield', {70 'Y' '-80'}, ...
      'changefield', {70 'Z' '-90'}, ...
      'changefield', {70 'sph_theta' '100'}, ...
      'changefield', {70 'sph_phi' '-28.84'}, ...
      'changefield', {70 'sph_radius' '85'}, ...
      'changefield', {71 'labels' 'U_VEOG'}, ...
      'changefield', {71 'theta' '-35.892'}, ...
      'changefield', {71 'radius' '0.52233'}, ...
      'changefield', {71 'X' '80'}, ...
      'changefield', {71 'Y' '-38'}, ...
      'changefield', {71 'Z' '-22'}, ... 
      'changefield', {71 'sph_theta' '35.892'}, ...
      'changefield', {71 'sph_phi' '-4.02'}, ...
      'changefield', {71 'sph_radius' '85'}, ...
      'changefield', {72 'labels' 'EX8'});