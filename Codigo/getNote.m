function Name = getNote( fMax )
%Mira cual nota es dependiendo de su frecuencia.
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
disp(fMax);
if(fMax >= DO-D && fMax <= DO+D)
    fprintf('La nota es Do');
    imshow('../imagenes/Nota-1.png');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-1.png');
    Name = 'Do';
end 

if(fMax >= RE-D && fMax <= RE+D)
    fprintf('La nota es Re');
    imshow('../imagenes/Nota-2.png');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    Name = 'Re';
end
if(fMax >= MI-D && fMax <= MI+D)
    fprintf('La nota es Mi');
    imshow('../imagenes/Nota-3.png');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    Name = 'Mi';
end 
if(fMax >= FA-D && fMax <= FA+D)
    fprintf('La nota es Fa');
    imshow('../imagenes/Nota-4.png');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    Name = 'Fa';
end
if(fMax >= FAS-D && fMax <= FAS+D)
    fprintf('La nota es Fa#');
    imshow('../imagenes/Nota-5.png');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    Name = 'Fa#';
end 
if(fMax >= SOL-D && fMax <= SOL+D)
    fprintf('La nota es Sol');
    imshow('../imagenes/Nota-6.png');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    Name = 'Sol';
end
if(fMax >= LA-D && fMax <= LA+D)
    fprintf('La nota es La');
    imshow('../imagenes/Nota-7.png');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    Name = 'La';
end 
if(fMax >= LAS-D && fMax <= LAS+D)
    fprintf('La nota es Las');
    imshow('../imagenes/Nota-8.png');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    Name = 'La#';
end 
if(fMax >= SI-D && fMax <= SI+D)
    fprintf('La nota es Si');
    imshow('../imagenes/Nota-9.png');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    Name = 'Si';
end 

end

