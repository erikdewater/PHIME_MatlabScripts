filepath = '/Users/dewate01/Desktop/Data_PHIME_renewal/Preprocessed';
cd (char(filepath)); 
dirpreproc = dir(char(filepath));
dirpreproc(~[dirpreproc.isdir]) = [];
dirpreproc(1:2) = [];
motion_table = num2cell(zeros(39,7));

for i=1:numel(dirpreproc)
    cd(char(strcat(filepath, '/', dirpreproc(i).name, '/fMRI/', '/FT/')));
    rp= dir('*rp*.txt');
    T = readtable(char(rp.name)); 
    A = table2array(T)
    C1 = A(:,1);
    C2 = A(:,2);
    C3 = A(:,3);
    Min_X = num2cell(min(C1));
    Min_Y = num2cell(min(C2));
    Min_Z = num2cell(min(C3));
    Max_X = num2cell(max(C1));
    Max_Y = num2cell(max(C2));
    Max_Z = num2cell(max(C3)); 
    str = string(rp.name);
    strc = char(str);
    subject = strc(6:14);
    C = {subject, Min_X, Min_Y, Min_Z, Max_X, Max_Y, Max_Z};
    motion_table(i,:)= C;
end

T2 = cell2table(motion_table, ...
    'VariableNames',{'Subject' 'Min_X' 'Min_Y' 'Min_Z', 'Max_X', 'Max_Y', 'Max_Z'});
cd (char(filepath)); 
writetable(T2, 'HeadMotion.txt');