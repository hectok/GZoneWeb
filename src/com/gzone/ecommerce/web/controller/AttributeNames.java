package com.gzone.ecommerce.web.controller;

public interface AttributeNames {
	
	public static final String ERROR = "error";
	public static final String USER = "user";
	
	// Codigos de error
	public static final String GENERIC_ERROR = "generic.error";
	public static final String MISSING_PARAMETER_ERROR = "missing.error";
	//Error de login
	public static final String USER_NOT_FOUND_ERROR = "El usuario no existe";
	public static final String WRONG_PASSWORD_ERROR = "Contraseña incorrecta";
	//Error de creacion
	public static final String DUPLICATED_USER = "Ese nombre de usuario ya esta cogido.";
	public static final String DUPLICATED_EMAIL = "Ese mail ya esta vinculado a otra cuenta.";
	//Error de busqueda
	public static final String NOT_FOUND = "No se ha encontrado ningún producto que cumpla esos requisitos.";
	//Error de cookies
	public static final String COOKIE_NULL = "La cookie ha devuelto un null";
	
	public static final String PRODUCT = "product";
}
