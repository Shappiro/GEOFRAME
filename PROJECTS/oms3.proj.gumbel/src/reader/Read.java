package reader;

// R script
import javax.script.*;
// OMS3 packages
import oms3.annotations.*;
// Others
import static java.lang.Math.*;

@Status(Status.DRAFT)

@Author(
	name="Aaron Iemma",
	org="DICAM - Departement of Environmental and Civil Engineering - Trento, UNITN",
	contact="iemma.ron@gmail.com"
)
@Description("A class to read a precipitation file from the Trentino automatic stations")
@Keywords("R,Renjin,precipitation,read,pluviometric station")

public class Read {
	/**
	 * Reads a given prec file
	 *
	 * @param file name
	 */
    @In public String precFileName;

    @Execute
    public void execute() throws Exception {
        ScriptEngineManager manager = new ScriptEngineManager();
        ScriptEngine renjin = manager.getEngineByName("Renjin");
        // check if the engine has loaded correctly:
        if(renjin == null) {
            throw new RuntimeException("Renjin Script Engine not found on the classpath.");
        }

        // R code here
        renjin.eval("station_data<-data.frame(read.table('" + precFileName + "', header=TRUE, na.string='--'))");
        renjin.eval("print(head(station_data))"); // TEST
    }
}
