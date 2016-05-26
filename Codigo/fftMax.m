function maxFs = fftMax( data, Fs )
%Calcula el valor maximo de la frecuencia
%data = datos del sonido
%Fs = frecuencia del sonido

xdft = fft(data);
[~,index] = max(abs(xdft(1:length(data)/2+1)));
freq = 0:(Fs/length(data)):Fs/2;
%fprintf('Maximum occurs at %2.3f Hz\n',freq(index))

maxFs = freq(index);

end
