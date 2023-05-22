<br>
<br>

### Development Environment Notes

* Edit the help file skeletons in 'man', possibly combining help files
  for multiple functions.
* Edit the exports in 'NAMESPACE', and add necessary imports.
* Put any C/C++/Fortran code in 'src'.
* If you have compiled code, add a useDynLib() directive to
  'NAMESPACE'.
* Run R CMD build to build the package tarball.
* Run R CMD check to check the package tarball.

Read "Writing R Extensions" for more information.

<br>
<br>

### Anaconda/Conda Notes

For the ``jupyter lab`` R kernel purposes, install ``r-irkernel``  

```shell
  conda install -c conda-forge r-irkernel
```

Henceforth, and especially if the virtual environment predominantly consists of anaconda channel 
packages, update ``conda`` via the ``anaconda channel``, i.e.,

```shell
  conda update -n base -c anaconda conda
```

or

```shell
  # Specifying the conda version
  conda update -n base -c anaconda conda==23.3.1
```

<br>
<br>

### Markdown Notes

* Special characters, etc.: https://www.toptal.com/designers/htmlarrows/


<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>
