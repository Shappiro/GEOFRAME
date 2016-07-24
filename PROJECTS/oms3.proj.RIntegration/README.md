Integration test between Java-OMS3-R
===================================

This is only a playground for testing the integration of OMS3 with R
statistical language through an R wrapper. 

**Chosen backends**:
* Definitely going to use *[Renjin](http://www.renjin.org/)*. Seems promising:

> "The biggest advantage of Renjin is that the R interpreter itself is a Java module which can be seamlessly integrated into any Java application. This dispenses with the need to load dynamic libraries or to provide some form of communication between separate processes.These types of interfaces are often the source of much agony because they place very specific demands on the environment in which they run."

* [TUTORIAL](http://docs.renjin.org/en/latest/introduction.html)
* [INSTALLATION PROCEDURE]()
	* `echo "deb https://nexus.bedatadriven.com/content/repositories/renjin-release/ ./" > /etc/apt/sources.list.d/renjin.list`
	* `sudo apt-get update`
	* `sudo apt-get install renjin`
* [PACKAGES](http://docs.renjin.org/en/latest/interactive/index.html): 
> From within Renjin’s REPL, there is no `install.packages()` function: the first time you try to load a package with `library()`, Renjin will check the repository for a package with the matching name and download it to a local repository located in `~/.m2/repository`.

* From [PROJECT SETUP](http://docs.renjin.org/en/latest/library/project-setup.html), it seems that for maximum flexibility I'll have to use a single JAR file if I'm not willing to use any project organizer (like Maven, or Eclipse). ANT should suffice as a build tool, with the automatically generated project directory //TODO: verify this
* [EXAMPLE CODE](http://docs.renjin.org/en/latest/library/evaluating.html)
		  
> From within Renjin’s REPL, there is no install.packages() function: the first time you try to load a package with library(), Renjin will check the repository for a package with the matching name and download it to a local repository located in ~/.m2/repository.


**Tested backends**:
* *[JRI](https://rforge.net/JRI/)*, which works through [REngine](https://github.com/s-u/REngine).
	* No compilation problem reported, but class does not seem to instantiate correctly
	during class launch. Also, lacks of thoroug documentation.
	
	Base class to be loaded:
	```java
	import org.rosuda.JRI.Rengine;
	```
**Backends in testing**:
* -

**PROGRESS - PROJECT COMPLETED**
- [x] Tested R and JAVA integration succesfully;
- [x] Test R and OMS3 integration by writing one OMS component which takes as input a strimg from the _simfile_
