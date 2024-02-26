# Ethylene_QCHEM_calcs

An example set of mixed scripts is designed to perform calculations for ethylene rotation.

To use it, first modify "coord.dat" to work within your own initial coordinates if desired. If this file needs to be modified, the coordinates must be the same; otherwise, random changes may appear. Also, the following connections must be maintained: Hydrogens 1 and 2 are linked to C5, and hydrogens 3 and 4 are linked to C6.

"ROT.f95" is a simple Fortran program that accepts this initial configuration and performs the twist for a given angle.

"MAIN.sh" controls the entire calculation; it creates folders and input files for the calculation with labels that resemble the twisting angle.

These scripts are recommended for educational purposes and practice with BASH, FORTRAN, and job submission to clusters.

The file "job.pbs" contains the set of specifications and instructions to run the programs in the cluster. "MAIN.sh" creates different files for different calculations and can submit these to the cluster. You can modify it with your cluster specifications and module control.
