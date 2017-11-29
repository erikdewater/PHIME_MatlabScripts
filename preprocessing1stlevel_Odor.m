clear

filepath = '/Users/dewate01/Desktop/Data_PHIME_renewal/Data';
inputs = cell(0, 1);
test_script_Yuri_fMRI_Odor
matlabbatch1{6}.spm.spatial.normalise.estwrite.eoptions.tpm = {'/Users/dewate01/Downloads/spm12/tpm/TPM.nii'};
%% File all the folders in the outer folder-(subjects)
dirinfo = dir(filepath); %Find everything inside the folder
dirinfo(~[dirinfo.isdir]) = []; %lists all subfolders in 'filepath' (Note: they should be in alphabetical order)
dirinfo(1:2) = []; % remove any subfolders that you don't want to analyze

%% Find all folders in the inner folders (assuming everything is the same
%%across subjects)-(fMRI tasks)
dirinfo_FMRI = dir(strcat(filepath,'/',dirinfo(1).name,'/fMRI')); %Find everything inside the subfolder
dirinfo_FMRI(~[dirinfo_FMRI.isdir]) = []; %lists all subsubfolders in the subfolder
dirinfo_FMRI(1:2) = []; % remove any subsubfolders that you don't want to use

%% Find all folders in the iner folders (assuming everything is the same
%%across subjects)-(structural)
dirinfo_struct = dir(strcat(filepath,'/',dirinfo(1).name)); %Find everything inside the subfolder
dirinfo_struct(~[dirinfo_struct.isdir]) = []; %lists all subsubfolders in the subfolder
dirinfo_struct(1:2) = []; % remove any subsubfolders that you don't want to use

%% Preallocate space
FullFilePath_FMRI=strings(numel(dirinfo)*numel(dirinfo_FMRI),1);
NewName_FMRI=strings(numel(dirinfo)*numel(dirinfo_FMRI),1);
Command_FMRI=strings(numel(dirinfo)*numel(dirinfo_FMRI),1);

FullFilePath=strings(numel(dirinfo)*numel(dirinfo_struct),1);
NewName=strings(numel(dirinfo)*numel(dirinfo_struct),1);
Command=strings(numel(dirinfo)*numel(dirinfo_struct),1);

%% Create everything
for h=1:numel(dirinfo) %Subjects loop
    
    for e=1:1%numel(dirinfo_struct) %structural
        FullFilePath(numel(dirinfo_struct)*(h-1)+e)=strcat(filepath,'/',dirinfo(h).name,'/',dirinfo_struct(e).name, '/'); % Full file path
        dirinfo3 = dir(char(FullFilePath(numel(dirinfo_struct)*(h-1)+e)));
        dirinfo3(1:2) = [];
        
        for f=1:numel(dirinfo3)
            matlabbatch1{2}.spm.util.import.dicom.data{f,1}=char(strcat(FullFilePath(numel(dirinfo_struct)*(h-1)+e),dirinfo3(f).name));
        end
        matlabbatch1{2}.spm.util.import.dicom.outdir{1,1} = char(FullFilePath(numel(dirinfo_struct)*(h-1)+e));
    end
    
    for g=3:3%1:numel(dirinfo_FMRI) %Tasks loop
        FullFilePath_FMRI(numel(dirinfo_FMRI)*(h-1)+g)=strcat(filepath,'/',dirinfo(h).name,'/fMRI/',dirinfo_FMRI(g).name, '/'); % Full file path
        dirinfo3_FMRI = dir(char(FullFilePath_FMRI(numel(dirinfo_FMRI)*(h-1)+g)));
        dirinfo3_FMRI(1:2) = [];
        
        for f=1:numel(dirinfo3_FMRI)
            matlabbatch1{1}.spm.util.import.dicom.data{f,1}=char(strcat(FullFilePath_FMRI(numel(dirinfo_FMRI)*(h-1)+g),dirinfo3_FMRI(f).name));
        end
        matlabbatch1{1}.spm.util.import.dicom.outdir{1,1} = char(FullFilePath_FMRI(numel(dirinfo_FMRI)*(h-1)+g));
    end
     spm('defaults', 'FMRI');
     spm_jobman('run', matlabbatch1, inputs{:});
    
end
for h=1:numel(dirinfo) %Subjects loop
    
    for j=3:3%numel(dirinfo_FMRI) %Tasks loop 
        FullFilePath_FMRI2=strcat(filepath,'/',dirinfo(h).name,'/fMRI/',dirinfo_FMRI(j).name, '/'); % Full file path
        cd(char(FullFilePath_FMRI2));
        prepr = dir('*swc*.nii'); 
        prepr(1)=[];
        rp = dir('*rp*.txt');
        for f=1:numel(prepr)
            matlabbatch2{1}.spm.stats.fmri_spec.sess.scans{f,1}=char(strcat(FullFilePath_FMRI2,prepr(f).name));    
        end
        matlabbatch2{1}.spm.stats.fmri_spec.sess.multi_reg{1,1}=char(strcat(FullFilePath_FMRI2,rp.name));
        cd(char(strcat(filepath, '/', dirinfo(h).name)))
        dir_model = strcat('model', '_', dirinfo(h).name, '_', dirinfo_FMRI(j).name);
        mkdir(char(dir_model));
        matlabbatch2{1}.spm.stats.fmri_spec.dir{1,1}= char(strcat(filepath, '/', dirinfo(h).name, '/', dir_model,'/'));
        matlabbatch2{2}.spm.stats.fmri_est.spmmat{1,1} = char(strcat(filepath,'/',dirinfo(h).name,'/',dir_model, '/','SPM.mat'));
        matlabbatch2{3}.spm.stats.con.spmmat{1,1} = char(strcat(filepath,'/',dirinfo(h).name,'/',dir_model, '/','SPM.mat'));

    end
     spm('defaults', 'FMRI');
     spm_jobman('run', matlabbatch2, inputs{:});
end