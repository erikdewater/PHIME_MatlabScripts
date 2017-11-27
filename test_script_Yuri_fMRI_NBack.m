
matlabbatch1{1}.spm.util.import.dicom.root = 'flat';
matlabbatch1{1}.spm.util.import.dicom.protfilter = '.*';
matlabbatch1{1}.spm.util.import.dicom.convopts.format = 'nii';
matlabbatch1{1}.spm.util.import.dicom.convopts.icedims = 0;

matlabbatch1{2}.spm.util.import.dicom.root = 'flat';
matlabbatch1{2}.spm.util.import.dicom.protfilter = '.*';
matlabbatch1{2}.spm.util.import.dicom.convopts.format = 'nii';
matlabbatch1{2}.spm.util.import.dicom.convopts.icedims = 0;

matlabbatch1{3}.spm.temporal.st.scans{1}(1) = cfg_dep('DICOM Import: Converted Images', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch1{3}.spm.temporal.st.nslices = 70;
matlabbatch1{3}.spm.temporal.st.tr = 1;
matlabbatch1{3}.spm.temporal.st.ta = 0.985714285714286;
matlabbatch1{3}.spm.temporal.st.so = [685 0 490 97.5 587.5 292.5 782.5 390 880 195 685 0 490 97.5 587.5 292.5 782.5 390 880 195 685 0 490 97.5 587.5 292.5 782.5 390 880 195 685 0 490 97.5 587.5 292.5 782.5 390 880 195 685 0 490 97.5 587.5 292.5 782.5 390 880 195 685 0 490 97.5 587.5 292.5 782.5 390 880 195 685 0 490 97.5 587.5 292.5 782.5 390 880 195];
matlabbatch1{3}.spm.temporal.st.refslice = 490;
matlabbatch1{3}.spm.temporal.st.prefix = 'a';

matlabbatch1{4}.spm.spatial.realign.estwrite.data{1}(1) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 1)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch1{4}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
matlabbatch1{4}.spm.spatial.realign.estwrite.eoptions.sep = 4;
matlabbatch1{4}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
matlabbatch1{4}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
matlabbatch1{4}.spm.spatial.realign.estwrite.eoptions.interp = 2;
matlabbatch1{4}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch1{4}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch1{4}.spm.spatial.realign.estwrite.roptions.which = [2 1];
matlabbatch1{4}.spm.spatial.realign.estwrite.roptions.interp = 4;
matlabbatch1{4}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch1{4}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch1{4}.spm.spatial.realign.estwrite.roptions.prefix = 'r';

matlabbatch1{5}.spm.spatial.coreg.estwrite.ref(1) = cfg_dep('DICOM Import: Converted Images', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch1{5}.spm.spatial.coreg.estwrite.source(1) = cfg_dep('Realign: Estimate & Reslice: Mean Image', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','rmean'));
matlabbatch1{5}.spm.spatial.coreg.estwrite.other(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 1)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rfiles'));
matlabbatch1{5}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch1{5}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch1{5}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch1{5}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch1{5}.spm.spatial.coreg.estwrite.roptions.interp = 4;
matlabbatch1{5}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch1{5}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch1{5}.spm.spatial.coreg.estwrite.roptions.prefix = 'c';

matlabbatch1{6}.spm.spatial.normalise.estwrite.subj.vol(1) = cfg_dep('DICOM Import: Converted Images', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch1{6}.spm.spatial.normalise.estwrite.subj.resample(1) = cfg_dep('Coregister: Estimate & Reslice: Resliced Images', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','rfiles'));
matlabbatch1{6}.spm.spatial.normalise.estwrite.eoptions.biasreg = 0.0001;
matlabbatch1{6}.spm.spatial.normalise.estwrite.eoptions.biasfwhm = 60;
matlabbatch1{6}.spm.spatial.normalise.estwrite.eoptions.affreg = 'mni';
matlabbatch1{6}.spm.spatial.normalise.estwrite.eoptions.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch1{6}.spm.spatial.normalise.estwrite.eoptions.fwhm = 0;
matlabbatch1{6}.spm.spatial.normalise.estwrite.eoptions.samp = 3;
matlabbatch1{6}.spm.spatial.normalise.estwrite.woptions.bb = [-78 -112 -70
                                                               78 76 85];
matlabbatch1{6}.spm.spatial.normalise.estwrite.woptions.vox = [2 2 2];
matlabbatch1{6}.spm.spatial.normalise.estwrite.woptions.interp = 4;
matlabbatch1{6}.spm.spatial.normalise.estwrite.woptions.prefix = 'w';

matlabbatch1{7}.spm.spatial.smooth.data(1) = cfg_dep('Normalise: Estimate & Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch1{7}.spm.spatial.smooth.fwhm = [5 5 5];
matlabbatch1{7}.spm.spatial.smooth.dtype = 0;
matlabbatch1{7}.spm.spatial.smooth.prefix = 's';

matlabbatch2{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch2{1}.spm.stats.fmri_spec.timing.RT = 1;
matlabbatch2{1}.spm.stats.fmri_spec.timing.fmri_t = 70;
matlabbatch2{1}.spm.stats.fmri_spec.timing.fmri_t0 = 35;
matlabbatch2{1}.spm.stats.fmri_spec.sess.scans = {};
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(1).name = 'Rest';
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(1).onset = [0
                                                         60
                                                         120
                                                         180
                                                         240
                                                         300
                                                         360
                                                         420];
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(1).duration = 20;
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(1).tmod = 0;
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(1).orth = 1;
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(2).name = '2Back';
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(2).onset = [20
                                                         140
                                                         260
                                                         380];
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(2).duration = 40;
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(2).tmod = 0;
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(2).orth = 1;
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(3).name = '3Back';
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(3).onset = [80
                                                         200
                                                         320
                                                         440];
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(3).duration = 40;
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(3).tmod = 0;
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch2{1}.spm.stats.fmri_spec.sess.cond(3).orth = 1;
matlabbatch2{1}.spm.stats.fmri_spec.sess.multi = {''};
matlabbatch2{1}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch2{1}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch2{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch2{1}.spm.stats.fmri_spec.bases.hrf.derivs = [1 0];
matlabbatch2{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch2{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch2{1}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch2{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch2{1}.spm.stats.fmri_spec.cvi = 'AR(1)';

matlabbatch2{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch2{2}.spm.stats.fmri_est.method.Classical = 1;

matlabbatch2{3}.spm.stats.con.consess{1}.tcon.name = 'Nback>rest';
matlabbatch2{3}.spm.stats.con.consess{1}.tcon.weights = [-2 0 1 0 1 0 0 0 0 0 0 0 0];
matlabbatch2{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch2{3}.spm.stats.con.consess{2}.tcon.name = 'rest>Nback';
matlabbatch2{3}.spm.stats.con.consess{2}.tcon.weights = [2 0 -1 0 -1 0 0 0 0 0 0 0 0];
matlabbatch2{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch2{3}.spm.stats.con.consess{3}.tcon.name = '3Back>2Back';
matlabbatch2{3}.spm.stats.con.consess{3}.tcon.weights = [0 0 -1 0 1 0 0 0 0 0 0 0 0];
matlabbatch2{3}.spm.stats.con.consess{3}.tcon.sessrep = 'none';
matlabbatch2{3}.spm.stats.con.delete = 1;