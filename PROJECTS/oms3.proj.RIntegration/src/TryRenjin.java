import javax.script.*;
// ... add additional imports here ...

public class TryRenjin {
    public static void main(String[] args) throws Exception {
        // create a script engine manager:
        ScriptEngineManager manager = new ScriptEngineManager();
        // create a Renjin engine:
        ScriptEngine renjin = manager.getEngineByName("Renjin");
        // check if the engine has loaded correctly:
        if(renjin == null) {
            throw new RuntimeException("Renjin Script Engine not found on the classpath.");
        }
        // R code here
        renjin.eval("df <- data.frame(x=1:10, y=(1:10)+rnorm(n=10))");
        renjin.eval("print(df)");
        renjin.eval("print(lm(y ~ x, df))");
        // ...Or, alternatively:
        // engine.eval(new java.io.FileReader("script.R"));  }
    }
}