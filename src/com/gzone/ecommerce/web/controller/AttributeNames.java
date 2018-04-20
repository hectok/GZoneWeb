package com.gzone.ecommerce.web.controller;

public interface AttributeNames {
	
	public static final String ERROR = "error";
	public static final String USER = "user";
	
	public static final String SIGN_IN_ERROR = "sign_in_error";
	public static final String SIGN_UP_ERROR = "sign_up_error";

	// Codigos de error
	public static final String GENERIC_ERROR = "generic.error";
	public static final String MISSING_PARAMETER_ERROR = "missing.error";
	//Error de login
	public static final String USER_NOT_FOUND_ERROR = "error.usuario_inexistente";
	public static final String WRONG_PASSWORD_ERROR = "error.contrasena_incorrecta";
	//Error de creacion
	public static final String DUPLICATED_USER = "error.usuario_duplicado";
	public static final String DUPLICATED_EMAIL = "error.mail_duplicado";
	//Error de busqueda
	public static final String NOT_FOUND = "error.busqueda";
	//Error de cookies
	public static final String COOKIE_NULL = "La cookie ha devuelto un null";
	
	//Error a la hora de añadir al carrito
	public static final String ALREADY_ON_CART = "error.carrito_duplicado";
	
	//Error de checkout sin iniciar sesion
	public static final String SESSION_ERROR = "error.inicia_sesion";

	public static final String PRODUCT = "product";
	
	public static final String HOTUSA = "hotusa";
	
	public static final String CHECKOUT_ERROR = "Por favor, rellene todos los campos.";
	public static final String ERROR_TARJETA = "Error validando su tarjeta de crédito";

}
