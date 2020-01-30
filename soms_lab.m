som = rand(10,10,3);
[som_high,som_length] = size(som);
obj1 = rand(1,3);

cellSOM = cell(som_high,som_length);
l = 0;
while l < som_length
    l = l + 1;
    h = 0;
    while h < som_high
        h = h + 1;
        cellSOM(h,l) = {[h,l]};
    end
end


umbr = obj1 - som; %suponemos que ese umbral es el que va a determinar a la neurona que mejor se adapta a este. Utilizamos distancia euclidiana 
min_value1 = min(min(abs(umbr))); %encuentra el valor mínimo 
[x, y] = find(umbr == min_value1); % deetrmina a la ganadora 

win = [x, y];
%la transformamos a coordenadas en el arreglo rectangular 
cellSOM_column = reshape(cellSOM, som_high .* som_length, 1); % Reshape nos genera una nueva forma de la celula que creamos inicialmente 
matrix_SOM = cell2mat(cellSOM_column);% cell2mat nos convierte de celula a matriz

win_2 = repmat(win, som_high .* som_length, 1);
distancias = pdist2(matrix_SOM, win_2,'euclidean'); %Obtenemos la distancia euclidiana 
distancias; % estas son las distancias con respecto a la ganadora 

distancias = distancias(:,1); %es la mejor 
distancias_matrix = reshape(distancias, som_high , som_length);

%Hacemos el som comon un arreglo de lista y trabajamos con eso 