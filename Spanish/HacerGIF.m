function HacerGIF( cell_imagenes , arch , dt )
%Genera una animación GIF de las imágenes en cell_imagenes con retardo dt
%en segundos

      
    for idx = 1:length(cell_imagenes)
        [A,map] = rgb2ind(cell_imagenes{idx},256);
        if idx == 1
            imwrite(A,map,arch,'gif','LoopCount',Inf,'DelayTime',dt);
        else
            imwrite(A,map,arch,'gif','WriteMode','append','DelayTime',dt);
        end
    end
end
