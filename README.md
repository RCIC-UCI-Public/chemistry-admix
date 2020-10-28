## chemistry-admix
chemistry and md software

### Amber

To build an mpi-enabled version will need to use on yaml
```bash
./configure -mpi gnu; make -j8 install; make clean
```

Download from https://ambermd.org/GetAmber.php after providing info on the form.
No direct download link available. Put on google drive as AmberTools19.tar.bz2 

From this download file create a distro with applied updates via:

```bash
bzcat AmberTools19.tar.bz2 | tar xf -
cd amber18
./update_amber -v
./update_amber --check-updates
./update_amber --update
./update_amber --show-applied-patches
```
The last commands reports:
```txt
AmberTools 19 Applied Patches:
------------------------------
update.1, update.2, update.3, update.4, update.5, update.6, update.7, update.8, update.9, update.10,
update.11 

```

Check version of Amber after patching
```bash
./update_amber -v
Version is reported as <version>.<patches applied>

	AmberTools version 19.11
```

Create a patched distribution:
```
tar czvf amber-19.11.tar.gz   amber18
```

Add amber-19.11.tar.gz to google drive and use this file for builds. 

### Openeye toolkits

From https://www.eyesopen.com/downloads provide needed email/contact info
get to  downloads page and see under TOOLKITS.

DO NOT place source distro on google drive. For verification:
```bash
sha1sum  OpenEye-toolkits-python3-linux-x64-2019.10.2.tar.gz
bd04df6d655015f528c2deee1fa4a368bcedf4bf OpenEye-toolkits-python3-linux-x64-2019.10.2.tar.gz
```

### LAMMPS 

Basic build options
https://lammps.sandia.gov/doc/Build_basics.html

Building LAMMPS using cmake (gitlab  develoeprs repo)
https://git.ecdf.ed.ac.uk/multiscale/lammps/blob/master/cmake/README.md

To enable cuda
- add to modules cuda
- add to cmake args -D PKG_GPU=on

Create lammps.<version>.cmake from copying <distro>/cmake/presets/ll_on.cmake
and removing some of the packages.

