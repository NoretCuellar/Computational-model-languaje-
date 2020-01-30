# Red Hebbiana para simulacion de lenguajes artificiales. 


#function [Wf] = hebb_lenguaje(A)# Matriz de activaciones umbral es el umbral 
A = input('Introduce tu matriz >> ');  ##Eliminar cuando este lista la función## 
b = input('Introduce un valor para beta >> '); # b es la tasa de aprendizaje
umbral = input('Introduce un valor para el umbra >>'); #Umbral o taza de aprendizaje

[total_t,neurons] = size(A) # Nos da el largo de la matriz que introduzcamos filas/columnas 
W = zeros(neurons) #La conexion comeinza en 0 pero podemos establecer los valores iniciales con otra matriz o alatoriamente, esto representa (Wab) 

Init_conect = A.- W 


for i = 1:total_t
  coactivacion = A(i,:) .* (A(i,:)') #Se calcula la coactivaciontivacion 
  
  arriba_umbral = coactivacion > umbral
  abajo_umbral = coactivacion < umbral
  
  delta_W_arriba = b .* coactivacion .* arriba_umbral
  delta_W_abajo = -b .* coactivacion .* abajo_umbral
  W = W + delta_W_arriba + delta_W_abajo #Esto nos estaría actualizando el peso  

endfor

Bet_connect = Init_conect.+W #Esto es lo que nos estaría dando los pesos de la nueva conexion 


plot(mean(W))
#Wmean = mean(Wf)


#endfunction