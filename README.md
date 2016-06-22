# Orga-Ejercicios
Ejercicios de organización de datos - MIPS

######Crear en el host con el usuario root un alias para la interfaz loopback
>ifconfig lo:0 172.20.0.1

######Inicio imagen netbsd
>./xgxemul -e 3max -d netbsd-pmax.img -x

######Abrir el tunel a unix desde netbsd
>ssh -R 2222:127.0.0.1:22 jorge@172.20.0.1

######Abrir shells remotos desde host contra guest
>ssh -p 2222 root@127.0.0.1

######Pasar el arch desde host al guest
>scp -P2222 -r ./tp1.s root@127.0.0.1:/root

## Análisis con Cachegrid :+1:
El módulo Cachegrid de [Valgrind](http://valgrind.org/) nos permite observar las referencias a memoria por instrucciones y datos, y los misses en los distintos niveles de caché. 
Cachegrind denomina LL al cache de ´ultimo nivel - Last Level - que podría ser L2 o L3 dependiendo de la computadora bajo estudio.

Ejemplo:

generar el ejecutable compilando con la opción -g
```
gcc -Wall -g -o Factorial Factorial.c factorial.S
```
el profiling del cache de nuestro programa lo ejecutamos así
```
valgrind --tool=cachegrind ./Factorial < archivoDeEntrada.txt > archivoSalida.out
```
si compilamos con la opción -g podemos ejecutar `cg_annotate` para obtener una presentación detallada del profiling realizado con cachegrind.
```
cg_annotate --auto=yes cachegrind.out.5537
```
