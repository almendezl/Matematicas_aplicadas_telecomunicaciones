aud = audiorecorder;

disp('grabando')
recordblocking(aud, 5);
disp('Fin grabacion');
audioData = getaudiodata(aud);
L = length(audioData);

subplot(3,1,1)
plot(audioData,  'Color',[0,0.5,0])
title('Onda del sonido en funcion del tiempo')
xlabel('t (segundos)')
ylabel('sonido(t)')


NFFT = 2^nextpow2(L); %Siguiente potencia de 2 a partir de la longitud
Y = fft(audioData,NFFT);%Transformada del audio
f = 5000/2*linspace(0,1,NFFT/2+1); %parametro de escala de x
subplot(3,1,2)
plot(f,2*abs(Y(1:NFFT/2+1)),  'Color',[0,1,1]) 
title('Onda del sonido en funcion de la frecuencia')
xlabel('F (Hz)')
ylabel('|sonido(t)|')

Z = ifft(Y);
f2 = 4*linspace(0,1,NFFT/2+1);
subplot(3,1,3)
plot(f2,Z(1:NFFT/2+1), 'Color',[0.635,0.078,0.1841]) 
title('FFT inversa')
xlabel('t (segundos)')
ylabel('sonido(t)')
