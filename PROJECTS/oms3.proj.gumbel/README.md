Porting of the code for analysis of peak rainfall events (returning times) 
==========================================================================
As the RIntegration project proved succesfull, I proceed here trying a more
thorough integration of a previous R project inside the OMS framework.

The best would be not to use R at all, but as the `evd` and `MASS` packages
provides everything we need, I'll try to build some wrappers using as little 
R code as possible.

Every `.R` file will be contained in a separate class.

**NEXT STEPS**
- [x] Create a JAVA class for precipitation file read
- Ask *StackExchange* for help with point 2 of the notes
- [] Create a JAVA class for every `.R` file
- [] Gain an understanding about how the input/output is managed through Renjin
- [] Select some JAVA library for plotting, or port the old R code to the 
	wonderful `ggplot2` lib


Links
=====
[Some review about the Gumbel distribution](https://en.wikipedia.org/wiki/Gumbel_distribution)
[The old repo for plotting and analysis of precipitation data](https://github.com/Shappiro/gumbel-hydro-R)

Notes
=====
1. Normally, building through `ant` command launched from the project directory is more than enough, although
	the `dooms -b` script is more flexible
2. Still having problems seeing output from the console... `dooms -s simfile.sim` does not work (returns strange
[SHA-256] string with other low-level messages), and neither does the normal `java -Doms3.work=... 
-Doms.resources=... -jar ... -s simfile.sim` (same error as `dooms -s simfile.sim`).