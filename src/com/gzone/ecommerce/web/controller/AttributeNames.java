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
	public static final String USER_NOT_FOUND_ERROR = "El usuario no existe";
	public static final String WRONG_PASSWORD_ERROR = "Contrase�a incorrecta";
	//Error de creacion
	public static final String DUPLICATED_USER = "Ese nombre de usuario ya esta cogido.";
	public static final String DUPLICATED_EMAIL = "Ese mail ya esta vinculado a otra cuenta.";
	//Error de busqueda
	public static final String NOT_FOUND = "No se ha encontrado ning�n producto que cumpla esos requisitos.";
	//Error de cookies
	public static final String COOKIE_NULL = "La cookie ha devuelto un null";
	
	//Error a la hora de a�adir al carrito
	public static final String ALREADY_ON_CART = "Ya has a�adido ese producto al carrito";
	
	//Error de checkout sin iniciar sesion
	public static final String SESSION_ERROR = "Debes iniciar sesion primero";

	public static final String PRODUCT = "product";
	
	public static final String HOTUSA = "hotusa";
	
	public static final String CHECKOUT_ERROR = "Ha ocurrido un error para realizar la compra";

}
