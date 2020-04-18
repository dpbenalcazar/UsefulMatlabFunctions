function pc = Malla3DdeDepthmap(imagen, depthmap, arch_salida, varargin)
%Guarda el modelo 3D de malla con la escala correcta y devuelve el modelo
%en nuve de puntos. La imagen y el depthmap deben tener el mismo tamaño.

    [H,W] = size(depthmap);
    if nargin <= 3
        escXY = 13.4737/H; % (12/171.5)*(192/H);
        escZ = 1.2/0.62;
    else
        escXY = varargin{1};
        escZ = varargin{2};
    end
    
    if class(imagen) ~= "double"
        imagen = im2double(imagen);
    end
    if class(depthmap) ~= "double"
        depthmap = im2double(depthmap);
    end
    
    im2 = flipud(imagen);
    [C,~] = rgb2ind(im2,256);
    [X,Y] = meshgrid(1:W,1:H);
    X = escXY * (X - W/2);
    Y = escXY * (Y - H/2);

    z = 1 - depthmap;
    z = z - min(z(:));
    Z = escZ*flipud(z);
    
    R = im2(:,:,1);
    G = im2(:,:,2);
    B = im2(:,:,3);
    col = [R(:),G(:),B(:)];
    
    pts = [X(:), Y(:), Z(:)];
    pc = pointCloud(pts,'Color',col); 
    
    nor = pcnormals(pc);
    pc = pointCloud(pts,'Color',col,'Normal',nor);
    
    [faces,verts,~] = surf2patch(X,Y,Z); % ,C ,'triangles'
    plywrite2(arch_salida, faces, verts, col, nor);
    
end

