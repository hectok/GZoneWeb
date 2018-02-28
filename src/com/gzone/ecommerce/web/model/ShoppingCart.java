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

	public void setLineas(List<ShoppingCartLine> lineas) {
		this.lines = lineas;
	}

	public double getTicketTotal() {
		return ticketTotal;
	}

	public void setTicketTotal(double ticketTotal) {
		this.ticketTotal = ticketTotal;
	}

	public void setLines(List<ShoppingCartLine> lines) {
		this.lines = lines;
	}
	
	//Metodo para retornar el numero de lineas que tiene el carrito
	public int numeroLineas() {
		  return lines.size();
	}
	
	//Metodo para eliminar un producto del carrito
	public void deleteProduct(Long idProducto) {
		  try {
		   lines.remove(idProducto - 1);
		   calculateOrderTotal();
		  } catch(NumberFormatException e) {
		  logger.error("Error al eliminar del carrito: "+ e.getMessage());	   
		  }
	}
	
	public void addCartItem(Producto p) {
		double precioTotal = 0.0;
		double precioProducto = 0.0;
		int cantidad = 1;
		ShoppingCartLine cartItem = new ShoppingCartLine();
		try {
			precioProducto = p.getPrecio()*cantidad;
			if (cantidad ==1) {
				precioTotal = precioProducto * cantidad;
				cartItem.setProduct(p);
				cartItem.setCantidad(cantidad);
				cartItem.setPrecioTotal(precioTotal);
				lines.add(cartItem);
				calculateOrderTotal();
			}

		} catch (NumberFormatException e) {
			logger.error("Error al añadir al carrito: "+ e.getMessage());	
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
		  double dblTotal = 0;
		  for(int counter=0;counter<lines.size();counter++) {
			  ShoppingCartLine cartItem = (ShoppingCartLine) lines.get(counter);
		   dblTotal+=cartItem.getPrecioTotal();
		    
		  }
		  setTicketTotal(dblTotal);
		 }
}

