package dty.test;

import java.io.File;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

public class Test {
	public static void main(String[] args) {
		Urlset urlset=new Urlset();
		urlset.setUrl("urls");
		urlset.setLoc("http://www.10333.com");
		urlset.setPriority("1.00");
		urlset.setLastmod("2013-12-04");
		urlset.setChangefreq("hourly");
		File file = new File("d:\\test\\file.xml");
		try {
			JAXBContext jaxbContext = JAXBContext.newInstance(Urlset.class);
			Marshaller jaxbMarshaller = jaxbContext.createMarshaller();

			jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			jaxbMarshaller.marshal(urlset,file);
			jaxbMarshaller.marshal(urlset,System.out);
			
		} catch (JAXBException e) {
			e.printStackTrace();
		}

		
	}

}
