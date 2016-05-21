function Notes = getNotes( data,Fs)
%Capta las notas 
DO = 523.25;
RE = 587.33;
MI = 659.26;
FA = 698.46;
FAS = 739.99;
SOL = 783.99;
LA = 880.0;
LAS = 932.33;
SI = 987.77;

D = 20;
f = [meanfreq(data,Fs,[DO-D DO+D]),...
    meanfreq(data,Fs,[RE-D RE+D]),...
    meanfreq(data,Fs,[MI-D MI+D]),...
    meanfreq(data,Fs,[FA-D FA+D]),...
     meanfreq(data,Fs,[FAS-D FAS+D]),...
     meanfreq(data,Fs,[SOL-D SOL+D]),...
     meanfreq(data,Fs,[LA-D LA+D]),...
     meanfreq(data,Fs,[LAS-D LAS+D]),...
     meanfreq(data,Fs,[SI-D SI+D]),...
     ];
f = round(f);
%f = meanfreq(data,Fs,[DO-D SI+D]);
disp(f);

for n = f
    getNote(n);
end
Notes = f;
end

