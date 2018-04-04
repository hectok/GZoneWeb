/**
 * 
 */
package com.gzone.ecommerce.web.util;

import java.util.ArrayList;
import java.util.List;

import com.gzone.ecommerce.model.Categoria;
import com.gzone.ecommerce.model.Idioma;
import com.gzone.ecommerce.model.NJugadores;


/**
 * @author usuario
 *
 */
public class ArrayUtils {

	public List<Categoria> arrayToCategoria(String [] arrayParameter){
		
		String[] categoria = arrayParameter;	
		Categoria iterator = new Categoria ();
		List<Categoria> categorias = new ArrayList<Categoria>();
		for (String c: categoria) {
			iterator.setIdCategoria(Long.valueOf(c));
			categorias.add(iterator);
		}
		return categorias;
	}
	
	public List<Idioma> arrayToIdioma(String [] arrayParameter){
			
			String[] idioma = arrayParameter;	
			Idioma iterator = new Idioma ();
			List<Idioma> listaIdiomas = new ArrayList<Idioma>();
			for (String c: idioma) {
				iterator.setIdIdioma(c);
				listaIdiomas.add(iterator);
			}
			return listaIdiomas;
		}
	
	public List<NJugadores> arrayToNJugadores(String [] arrayParameter){
		
		String[] njugadores = arrayParameter;	
		NJugadores iterator = new NJugadores ();
		List<NJugadores> lista = new ArrayList<NJugadores>();
		for (String c: njugadores) {
			iterator.setIdNJugadores(Long.valueOf(c));
			lista.add(iterator);
		}
		return lista;
	}

}
