set path ../PDB/
cd $path
set list [glob -type d *]
foreach dir $list {
    cd $dir
    set file [lsort [glob -type f *.ent.pdb]]
    set psfFile [glob -nocomplain -type f *_autopsf.psf] 
    if {$psfFile != [] } {
        puts "folder preperations done $file"
        cd ..
        continue
    }
    puts "Not existed"
    mol new $file
    autopsf $file-top top_all27_prot_lipid_na.inp
    cd ..
}



