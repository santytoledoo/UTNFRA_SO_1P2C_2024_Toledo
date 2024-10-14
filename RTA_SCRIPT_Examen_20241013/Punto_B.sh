#!/bin/bash

sudo fdisk /dev/sdc <<EOF
n


+1G
n


+1G
n


+1G
n


+1G
n


+1G
n


+1G
n


+1G
n


+1G
n


+1G
n


+1G
w
EOF

for i in $(seq 1 10); do
    sudo mkfs.ext4 /dev/sdc$i
done

sudo tee -a /etc/fstab << EOF
/dev/sdc1 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0
/dev/sdc2 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0
/dev/sdc3 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0
/dev/sdc4 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0
/dev/sdc5 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0
/dev/sdc6 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0
/dev/sdc7 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0
/dev/sdc8 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0
/dev/sdc9 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0
/dev/sdc10 /Examenes-UTN/profesores ext4 defaults 0 0
EOF

sudo mount -a
