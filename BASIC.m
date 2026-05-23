

clc;
disp('=== NS2 Automatic Installation for Windows (Cygwin) ===');

cygDir = 'C:\cygwin64';
nsDir = fullfile(cygDir, 'home', getenv('USERNAME'), 'ns2');
nsVer = 'ns-allinone-2.35';
nsTar = [nsVer '.tar.gz'];
nsPath = fullfile(nsDir, nsTar);

% Official mirror link
nsURL = 'https://downloads.sourceforge.net/project/nsnam/allinone/ns-allinone-2.35/ns-allinone-2.35.tar.gz';

%% Step 1 — Install Cygwin if missing
if ~isfolder(cygDir)
    disp('Cygwin not found. Installing now...');
    setupURL = 'https://cygwin.com/setup-x86_64.exe';
    setupExe = fullfile(tempdir, 'setup-x86_64.exe');
    websave(setupExe, setupURL);
    system([setupExe ' -q -N -d -R ' cygDir ...
        ' -s https://mirror.csclub.uwaterloo.ca/cygwin/ ' ...
        '-P wget,tar,gcc-core,gcc-g++,make,perl,tcl,tk']);
else
    disp('Cygwin already installed.');
end

%% Step 2 — Create NS2 directory
if ~exist(nsDir, 'dir')
    mkdir(nsDir);
end

%% Step 3 — Download NS2
if ~isfile(nsPath)
    try
        disp('Downloading NS2 (v2.35) ...');
        websave(nsPath, nsURL);
    catch
        disp('Automatic download failed.');
        disp('Please manually download:');
        disp('https://sourceforge.net/projects/nsnam/files/allinone/ns-allinone-2.35/');
        disp(['Then place it here: ' nsPath]);
        input('Press Enter once the file is downloaded and placed correctly...');
    end
else
    disp('NS2 package already exists.');
end

%% Step 4 — Extract and build NS2
disp('Extracting and building NS2 inside Cygwin...');
buildCmd = [
    'bash -lc "cd ~/ns2 && tar -xvzf ' nsTar ...
    ' && cd ' nsVer ' && ./install"'
];
system(['"' cygDir '\bin\bash.exe" -lc "' buildCmd '"']);

%% Step 5 — Add NS2 to PATH (Windows)
nsBinPath = [cygDir '\home\' getenv('USERNAME') '\ns2\' nsVer '\bin'];
disp(['Adding to PATH: ' nsBinPath]);
setx('PATH', [nsBinPath ';%PATH%']);

%% Step 6 — Verify NS2 Installation
disp('Verifying NS2 installation...');
[status, result] = system(['"' cygDir '\bin\bash.exe" -lc "ns"']);
if contains(result, 'ns-2.35')
    disp('NS2 successfully installed and verified!');
else
    warning('NS2 installation finished, but verification failed.');
    disp(result);
end

disp('=== Installation Complete ===');
disp('You can now run NS2 simulations from MATLAB:');
disp('  system(''C:\\cygwin64\\bin\\bash.exe -lc "cd ~/ns2 && ns demo.tcl"'');');
