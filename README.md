# Orga-Ejercicios
Ejercicios de organización de datos - MIPS

####inicio imagen netbsd
./xgxemul -e 3max -d netbsd-pmax.img -x

####crear en el host con el usuario root un alias para la interfaz loopback
ifconfig lo:0 172.20.0.1

####para abrir el tunel a unix desde netbsd
ssh -R 2222:127.0.0.1:22 jorge@172.20.0.1

####para abrir shells remotos desde host contra guest
ssh -p 2222 root@127.0.0.1

####pasar el arch desde host al guest
scp -P2222 -r ./tp1.s root@127.0.0.1:/root

####para compilar en netbsd
gcc -Wall -g -o a8s Factorial.c factorial.S