Integratin test between Java-OMS3-R
===================================

This is only a playground for testing the integration of OMS3 with R
statistical language through an R wrapper. 


Tested backends:
* *[JRI](https://rforge.net/JRI/)*, which works through [REngine](https://github.com/s-u/REngine).
	* No compilation problem reported, but class does not seem to instantiate correctly
	during class launch. Also, lacks of thoroug documentation.

Backends in testing:
* *[Renjin](http://www.renjin.org/)*. Seems promising
>The biggest advantage of Renjin is that the R interpreter itself is a Java module which can be seamlessly integrated into any Java >application. This dispenses with the need to load dynamic libraries or to provide some form of communication between separate processes. >These types of interfaces are often the source of much agony because they place very specific demands on the environment in which they run.

