#!/bin/bash
sudo groupadd p1c22024_gAlumno
sudo groupadd p1c2_2024_gProfesores


USUARIOS=("p1c2_2024_A1" "p1c2_2024_A2" "p1c2_2024_A3")


HASH_CLAVE=$(openssl passwd -6 "vagrant")


for i in {0..2}; do
    sudo useradd -m -G p1c2_2024_gAlumno -p "$HASH_CLAVE" "${USUARIOS[$i]}"
    sudo chown -R "${USUARIOS[$i]}:${USUARIOS[$i]}" "/Examenes-UTN/alumno$((i + 1))"
done


sudo useradd -m -G p1c22024_gProfesores -p "$HASH_CLAVE" p1c2_2024_P1
sudo chown -R p1c2_2024_P1:p1c2_2024_P1 /Examenes-UTN/profesores


sudo chmod -R 750 /Examenes-UTN/alumno{1,2,3}
sudo chmod -R 770 /Examenes-UTN/profesores


for i in {0..2}; do
    sudo su - "${USUARIOS[$i]}" -c "whoami > /Examenes-UTN/alumno_$((i + 1))/validar.txt"
done
sudo su - p1c2_2024_P1 -c "whoami > /Examenes-UTN/profesores/validar.txt"
