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
if(fMax >= DO-D && fMax <= DO+D)
    w = warning('query','last');
    id = w.identifier;
    warning('off',id);
    
    %fprintf('La nota es Do');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-1.png');
    imshow('../imagenes/do.png');
    
    Name = 'Do';
elseif(fMax >= RE-D && fMax <= RE+D)
    %fprintf('La nota es Re');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    imshow('../imagenes/re.png');
    
    Name = 'Re';
elseif(fMax >= MI-D && fMax <= MI+D)
    %fprintf('La nota es Mi');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    
    imshow('../imagenes/mi.png');
    
    Name = 'Mi';
elseif(fMax >= FA-D && fMax <= FA+D)
    %fprintf('La nota es Fa');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    imshow('../imagenes/fa.png');
    Name = 'Fa';
elseif(fMax >= FAS-D && fMax <= FAS+D)
    %fprintf('La nota es Fa#');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    imshow('../imagenes/fa#.png');
   
    Name = 'Fa#';
elseif(fMax >= SOL-D && fMax <= SOL+D)
    %fprintf('La nota es Sol');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    imshow('../imagenes/sol.png');
    Name = 'Sol';
elseif(fMax >= LA-D && fMax <= LA+D)
    %fprintf('La nota es La');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    imshow('../imagenes/la.png');
    Name = 'La';
elseif(fMax >= LAS-D && fMax <= LAS+D)
    %fprintf('La nota es Las');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    Name = 'La#';
elseif(fMax >= SI-D && fMax <= SI+D)
    %fprintf('La nota es Si');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    imshow('../imagenes/Si.png');
    Name = 'Si';
else
    %fprintf('No es una nota reconosible');
    %imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    imshow('../imagenes/NOTA_MALA.png');
    Name = 'Si';
end

end

