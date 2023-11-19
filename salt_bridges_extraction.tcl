set path ../PDB/
cd $path
set list [lsort [glob -type d *] ]
foreach dir $list {
    cd $dir

    set psfFile [glob -nocomplain -type f *_autopsf.psf] 
    set pdbFile [glob -nocomplain -type f *_autopsf.pdb]
    set check_sb [glob -nocomplain -type d salt_bridges]
    if {$psfFile != [] && $pdbFile !=[] && $check_sb == [] } {
        
        #loading molecules
        mol new $psfFile 
        mol addfile $pdbFile
        
        cd ./out
        set dcd [glob -nocomplain -type f pro.dcd]
        mol addfile $dcd
        cd ..

        #generating salt bridges
        file mkdir salt_bridges
        saltbr -sel [atomselect top all] -outdir ./salt_bridges
        mol delete allDy
        puts "done"
        break
    }
    cd ..
}

