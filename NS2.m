clc;
disp('=== NS2 Download Script for Windows (Cygwin) ===');

% Define Cygwin home and NS2 directories
cygDir = 'C:\cygwin64';
nsDir = fullfile(cygDir, 'home', getenv('USERNAME'), 'ns2');
nsVer = 'ns-allinone-2.35';
nsTar = [nsVer '.tar.gz'];
nsPath = fullfile(nsDir, nsTar);

% Official download link
nsURL = 'https://downloads.sourceforge.net/project/nsnam/allinone/ns-allinone-2.35/ns-allinone-2.35.tar.gz';

%% Step 1 — Create target directory
if ~exist(nsDir, 'dir')
    mkdir(nsDir);
    disp(['Created directory: ' nsDir]);
else
    disp(['Directory already exists: ' nsDir]);
end

%% Step 2 — Download NS2 package
if ~isfile(nsPath)
    try
        disp('Downloading NS2 (v2.35) ...');
        websave(nsPath, nsURL);
        disp(['NS2 downloaded successfully to: ' nsPath]);
    catch ME
        disp('Automatic download failed.');
        disp('Please manually download from:');
        disp('https://sourceforge.net/projects/nsnam/files/allinone/ns-allinone-2.35/');
        disp(['Then place the file here: ' nsPath]);
        disp(['Error details: ' ME.message]);
    end
else
    disp('NS2 package already exists. Skipping download.');
end

disp('=== NS2 Download Complete ===');
    