
public aspect VerificarSesion{
	//Definimos el pointcut
	 pointcut iniciarSesion(): call (void Entidad.consultar(String));
    // Definimos el advice
	before():iniciarSesion(){
		//Metodo de inicio de sesion
		if(!IniciarSesion.sesionIniciada && !Entidad.mensaje.isVisible()) {
			IniciarSesion.initialize();
			
		}else if (IniciarSesion.sesionIniciada && !Entidad.mensaje.isVisible()) {
			Entidad.mensaje.setVisible(true);
		}
	}
	
	after(): iniciarSesion(){
		//Ya se inicio sesion Puede imprimir un mensaje
		if(IniciarSesion.sesionIniciada) {
			System.out.println("Bienvenido");
			Entidad.mensaje.setVisible(true);
		}else {
			System.out.println("Inicie Sesion por favor");
		}
	}
}