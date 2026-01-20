pseudocodigo ACO
Cada hormiga debe proponer un recorrido teniendo en cuenta la distancia y las feromonas hasta encontrar el camino de menor longitud
Tengo la matriz de distancias y la matriz de feromonas 

Inicializar la matriz de feromonas con valores aleatorios entre 0 y 0.1 o con todos 1
Ubicar n hormigas en el nodo origen (también podria ser en distintos nodos)
repetir
    para cada hormiga k
        p_k(t) = [] #nodos que va recorriendo la hormiga k en el tiempo t
        repetir
            seleccionar el próximo nodo según la probabilidad 
            p_ij = sigma_ij^alpha * eta_ij^beta / sum(sigma_ij^alpha * eta_ij^beta) si j pertenece a los nodos no visitados
            p_ij = 0 si j pertenece a los nodos visitados
            -> eta_ij = 1/d_ij (d_ij es la distancia entre i y j)
            -> alpha y beta son parámetros que ponderan la importancia de las feromonas y la distancia respectivamente

            agregar un paso (i,j) al recorrido p_k(t)
        hasta llegar al nodo destino

        calcular la longitud del recorrido -> l_k(t) = f(p_k(t))
    finPara

    #actualizar la matriz de feromonas:
    #simular la evaporación de las feromonas
    sigma_ij(t) = (1-rho) * sigma_ij(t)  para todo (i,j) -> rho es el coeficiente de evaporación (0 < rho < 1)

    #depositar feromonas según la calidad del recorrido:
    método global: delta_sigma_ij(t) = tau/l_k(t)
    método uniforme: delta_sigma_ij(t) = tau
    método local: delta_sigma_ij(t) = tau/d_ij

    #actualizar la matriz de feromonas
    sigma_it(t+1) = sigma_ij(t) + delta_sigma_ij(t) para todo (i,j) en p_k(t)
    guardar hormiga elite
    t++
hasta que todas las hormigas sigan el mismo camino (tener un contador de iteraciones de alineación) o se alcance un número máximo de iteraciones 
return mejor recorrido encontrado
    

       


