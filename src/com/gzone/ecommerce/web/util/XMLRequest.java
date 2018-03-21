package com.gzone.ecommerce.web.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class XMLRequest {
	public static String get_response() throws IOException {

		 StringBuffer result = new StringBuffer(); 
		 StringBuffer xml = new StringBuffer(); 
		 
		//************************************************************************** 
		// Obtenemos la relaci�n con los datos XML seg�n sistema escogido 
		// (s�lo escoger uno) 
		 //**************************************************************************   
		 

		// sistema datos xml 2: leemos los datos XML de un archivo y las codificamos 
		 // en una variable
		 FileReader fitxer = new FileReader("C:\\Users\\Hector\\Documents\\daw-dwcs17\\GZoneWeb\\WebContent\\xml\\15.xml");
		 int i = 0; while ((i=fitxer.read())!=-1) xml.append((char)i); String xmlEncoded = URLEncoder.encode(xml.toString()); 
		 
		 
		//*************************************************************************** 
		 // Hacemos la conexi�n con el servidor XML y le pasamos los par�metros de  
		 // identificaci�n y los datos de peticion 
		 //*************************************************************************** 
		 
		URL url = new URL("http://xml.hotelresb2b.com/xml/listen_xml.jsp"); 
		URLConnection connection = url.openConnection(); 
		connection.setDoOutput(true); 
		 
		PrintWriter out2 = new PrintWriter(connection.getOutputStream()); 
		 
		// Todos los par�metros van precedidos de un signo & excepto el primero. 
		 
		// Par�metros de identificacion 
		out2.print("afiliacio=RS"); 
		out2.print("&secacc=9996"); 
		out2.print("&usuario=E21098");
		out2.print("&codigousu=FPDUAL");
		out2.print("&clausu=489218RS"); 
		 
		// Par�metros de petici�n seg�n sistema escogido (acorde con lo de m�s arriba) // (s�lo escoger uno) 

		// sistema datos xml 2: datos cargado en memoria previamente  
		out2.print("&xml=" + xmlEncoded); 
		 
		// al acabar la secuencia de par�metros printar &\n 
		out2.print("&\n"); 
		out2.close(); 
		 
		//**************************************************************************************
		// Obtenemos respuesta del servidor xml y la mostramos 
		//************************************************************************************** 
		 
		BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream())); 
		String inputLine; 
		while ((inputLine = in.readLine()) != null) 
			result.append(inputLine); 
		in.close();   
		
		out2.write((String)result.toString());  
		// salida web 
		return result.toString();
	}
	public static void main (String args []) throws IOException {
		String imprimir ;
		imprimir = get_response();
		System.out.println(imprimir);
	}
}
