package com.gzone.ecommerce.web.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.gzone.ecommerce.model.Producto;


public class ShoppingCart {
	private static Logger logger = LogManager.getLogger(ShoppingCart.class.getName());

	private List<ShoppingCartLine> lines = null;
	private double ticketTotal ;
	
	public ShoppingCart() {
		lines = new ArrayList<ShoppingCartLine>();
	}
	
	public void add(ShoppingCartLine p) {
		lines.add(p);
	}

	public List<ShoppingCartLine> getLines() {
		return lines;
	}
	
	public void setLines(List<ShoppingCartLine> lines) {
		this.lines = lines;
	}

	public double getTicketTotal() {
		return ticketTotal;
	}

	public void setTicketTotal(double ticketTotal) {
		this.ticketTotal = ticketTotal;
	}

	public void setLineas(List<ShoppingCartLine> lineas) {
		this.lines = lineas;
	}
	
	//Metodo para retornar el numero de lineas que tiene el carrito
	public int numeroLineas() {
		  return lines.size();
	}
	
	//Metodo para eliminar un producto del carrito
	public void deleteProduct(Long idProducto) {
		try {
			for (int i=0;i<lines.size();i++) {
				if (lines.get(i).getProduct().getIdProducto()==idProducto) {
					lines.remove(i);
				}
			}
			calculateOrderTotal();	   
			   
		} catch(NumberFormatException e) {
			  
			logger.error("Error al eliminar del carrito: "+ e.getMessage());	   
		}
	}
	
	//Metodo para a�adir una linea al carrito
	public void addCartItem(Producto p) {
		
		ShoppingCartLine cartItem = new ShoppingCartLine();
		try {
			cartItem.setProduct(p);
			cartItem.setPrecioTotal(p.getPrecio());
			lines.add(cartItem);
			calculateOrderTotal();

		} catch (NumberFormatException e) {
			logger.error("Error al a�adir al carrito: "+ e.getMessage());	
		}
	}

	public void addCartItem(ShoppingCartLine lineaProducto) {
		lines.add(lineaProducto);
	}

	public ShoppingCartLine getCartItem(int iItemIndex) {
		ShoppingCartLine cartItem = null;
		if (lines.size() > iItemIndex) {
			cartItem = (ShoppingCartLine) lines.get(iItemIndex);
		}
		return cartItem;
	}
	
	protected void calculateOrderTotal() {
		  double totalCarrito = 0;
		  for(int contador=0;contador<lines.size(); contador++) {
			  ShoppingCartLine cartItem = (ShoppingCartLine) lines.get(contador);
			  totalCarrito+=cartItem.getPrecioTotal();
		    
		  }
		  setTicketTotal(totalCarrito);
	 }
}

