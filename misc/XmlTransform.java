import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;

public class XmlTransform {
    public static void main(String[] args) throws IOException, URISyntaxException, TransformerException {
	if (args == null || args.length != 3) {
		System.err.println("Usage: java XmlTransform XML_FILE XSL_FILE OUTPUT");
		System.exit(-1);
	}

        TransformerFactory factory = TransformerFactory.newInstance();
        Source xslt = new StreamSource(new File(args[1]));
        Transformer transformer = factory.newTransformer(xslt);

        Source text = new StreamSource(new File(args[0]));
        transformer.transform(text, new StreamResult(new File(args[2])));
    }
}
