package com.gzone.ecommerce.web.model;

import com.gzone.ecommerce.model.Producto;

public class ShoppingCartLine {
	
	private Producto product = null;
    private Integer cantidad = 1;
    private double precioTotal;
	
	public ShoppingCartLine() {

	}

	public Producto getProduct() {
		return product;
	}

	public void setProduct(Producto product) {
		this.product = product;
	}

	public double getPrecioTotal() {
		return precioTotal;
	}

	public void setPrecioTotal(double precioTotal) {
		this.precioTotal = precioTotal;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	
}
