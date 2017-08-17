#bin/bash
mkdir -p temp

mv *G0.0_4.61* temp
mv *G0.0_5.26* temp
mv *G0.0_5.92* temp
mv *G4.0_-0.61* temp
mv *G4.0_-1.26* temp
mv *G4.0_-1.91* temp

rm *.job *.inp
mv ./temp/* .			
