#!/bin/bash
# Main program to create files and carpets
# Copy files for work and call for rotation program.
# Obtain the input files for QCHEM with the rotations.

WORKDIR=$PWD

      for i in $(seq 0 5 90)
      do
      mkdir "file"_$i
      cp ./job.pbs "file"_$i
      cp ./coord.dat "file"_$i
      cp ./ROT.f95 "file"_$i
      cp ./RAS.inp "file"_$i

      cd ./"file"_$i
      sed -i "s/NAME/$i/g" job.pbs
      sed -i "s/AAAA/$i/g" ROT.f95
      cd ..
      done

###LAUNCH ROTATION-FORTRAN PROGRAM
      for i in $(seq 0 5 15)
      do
      cd ./"file"_$i
      gfortran ROT.f95
      ./a.out
      cd ..
      done

### EDIT RAS.inp with new coordinates
      for i in $(seq 0 5 15)
      do
      cd ./"file"_$i

      coord_file="./rot_coord"
      k=1    #k es un contador
      while IFS= read -r line
      do
#      echo "$line"
      sed -i "s/"ATOM"_$k/$line/g" RAS.inp
          k=$((k+1))
      done <"$coord_file"
#CLEAN THE FOLDER FROM UNNECESARY FILES
      rm a.out coord.dat rot_coord ROT.f95
      cd ..
      done  

# submit calculations to ATLAS
#      for i in $(seq 0 5 15)
#      do
#      cd $WORKDIR/"file"_$i
#      qsub job.pbs
#      cd $WORKDIR
#      done
