/**
 * 
 */
package com.gzone.ecommerce.web.util;

import java.util.ArrayList;
import java.util.List;


/**
 * @author usuario
 *
 */
public class ArrayToLong {

	protected static List<Long> arraytolong(String [] arrayParameter){
		
		String[] categoria = arrayParameter;
		
		List<Long> categorias = new ArrayList<Long>();
		for (String c: categoria) {
			categorias.add(Long.valueOf(c));
		}
		return categorias;
	}
}
