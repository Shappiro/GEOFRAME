Repository for handling scripts and scratches for GEOFRAME/OMS3 project
=======================================================================

**Next steps for the project are**:
- [x] Create a script to run compilation, project directory structure generation and simfiles
- [x] Test the script thorougfully
- [] Think about the implementation of some FORTRAN code, starting from the links provided:
	1. https://alm.engr.colostate.edu/cb/wiki/16993
	2. https://alm.engr.colostate.edu/cb/wiki/17097
	3. https://alm.engr.colostate.edu/cb/wiki/17105#section-OMS3_2FFortran9x+Integration+Example_
	4. https://teamwork.niwa.co.nz/display/IFM/Implementing+a+FORTRAN+model+in+OMS3 > see sparrow example
- [] Think about the needed JAVA classes for the Richards integration code from *Casulli et al*.
- [x] Test OMS3 and R integration > Port the Gumbel code

**Should I take a look at some FORTRAN components that we already want to integrate inside the GEOFRAME?**
- [HydroGen] (https://github.com/geoframecomponents/Hydro_gen), a computer code for generating two-dimensional space random functions with an assigned covariance structure. The original code is written in Ansi Fortran 77.
- ...

Links
=====
* [Markdown syntax] (https://guides.github.com/features/mastering-markdown/)
* [GEOFrame source code](https://github.com/geogramecomponents)
* [GEOFrame projects](https://github.com/GEOframeOMSProjects)

Trivia
======
* This has been a pain... **REMEMBER** to include the base class path inside the `-classpath` during JAVA program execution! *e.g.*:
`java -classpath .:../lib/renjin-script-engine-0.8.2165-jar-with-dependencies.jar TryRenjin`
`.` obviously stands for "this dir", so the commant above assumes you're executing the code inside the class directory. 
* **THE BIGGEST PAINSOURCE OF ALL**: for some reason, `java` does not interpret correctly `~` as `$HOME`. So, better use `$HOME` directly for scripting. 
* Example of packaged program execution (also, nice use of dot notation for upwards directory navigation): `java -classpath ./:../../../JAVA_BASE_CLASSES/renjin-script-engine-0.8.2165-jar-with-dependencies.jar example1.TryRenjin` 

Remember: *five pushes a day keeps the doctor away*