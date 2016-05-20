function Name = getNote( fMax )
%Mira cual nota es dependiendo de su frecuencia.
disp(fMax);
if(fMax >= 500.0 && fMax <= 530.0)
    fprintf('La nota es Do');
    imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-1.png');
    Name = 'Do';
end 

if(fMax >= 587.33 && fMax <= 617.0)
    fprintf('La nota es Re');
    imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-2.png');
    Name = 'Re';
end 

end

