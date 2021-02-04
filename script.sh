##set variable name
moleculename=6xc4

##pack molecules into a box
packmol < packmol.inp 

##make a gro file
gmx_mpi editconf -f $moleculename.pdb -o $moleculename.gro -c -d 1.0 -bt cubic -box 8 8 8

##add a solvant to the simulation
gmx_mpi solvate -cp $moleculename.gro -o solv.gro -p topol.top

##copy required files
cp -r /suppscr/stf/rhodese/mdp mdp

##ions
gmx_mpi grompp -f mdp/ions.mdp -c solv.gro -p topol.top -o ions.tpr
echo "Grompped ions." >> $HOMEPATH/emlog.txt



