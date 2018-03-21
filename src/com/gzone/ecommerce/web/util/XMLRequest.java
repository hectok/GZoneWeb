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
		// Obtenemos la relación con los datos XML según sistema escogido 
		// (sólo escoger uno) 
		 //**************************************************************************   
		 

		// sistema datos xml 2: leemos los datos XML de un archivo y las codificamos 
		 // en una variable
		 FileReader fitxer = new FileReader("C:\\Users\\Hector\\Documents\\daw-dwcs17\\GZoneWeb\\WebContent\\xml\\15.xml");
		 int i = 0; while ((i=fitxer.read())!=-1) xml.append((char)i); String xmlEncoded = URLEncoder.encode(xml.toString()); 
		 
		 
		//*************************************************************************** 
		 // Hacemos la conexión con el servidor XML y le pasamos los parámetros de  
		 // identificación y los datos de peticion 
		 //*************************************************************************** 
		 
		URL url = new URL("http://xml.hotelresb2b.com/xml/listen_xml.jsp"); 
		URLConnection connection = url.openConnection(); 
		connection.setDoOutput(true); 
		 
		PrintWriter out2 = new PrintWriter(connection.getOutputStream()); 
		 
		// Todos los parámetros van precedidos de un signo & excepto el primero. 
		 
		// Parámetros de identificacion 
		out2.print("afiliacio=RS"); 
		out2.print("&secacc=9996"); 
		out2.print("&usuario=E21098");
		out2.print("&codigousu=FPDUAL");
		out2.print("&clausu=489218RS"); 
		 
		// Parámetros de petición según sistema escogido (acorde con lo de más arriba) // (sólo escoger uno) 

		// sistema datos xml 2: datos cargado en memoria previamente  
		out2.print("&xml=" + xmlEncoded); 
		 
		// al acabar la secuencia de parámetros printar &\n 
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
