filepath = '/Users/dewate01/Desktop/Data_PHIME_renewal/Preprocessed';
cd (char(filepath)); 
dirpreproc = dir(char(filepath));
dirpreproc(~[dirpreproc.isdir]) = [];
dirpreproc(1:2) = [];

for i=1:numel(dirpreproc)
    cd(char(strcat(filepath, '/', dirpreproc(i).name, '/fMRI/', '/FT/')));
    mkdir Preprocessed 
    copyfile '*swc*.nii' Preprocessed
    copyfile '*rp*.txt' Preprocessed
    delete *.nii 
end 