class Cancion{
	var nombre
	var duracion
	var letra
	constructor(unNombre,unaDuracion,unaLetra){
		nombre=unNombre
		duracion=unaDuracion
		letra=unaLetra
	}
	method nombre()=nombre
	method letra()=letra.fold("",{unString,otroString=>unString+" "+otroString}).drop(1)
	method duracion()=duracion
	method longitudCancion(){
		return self.letra().size()
	}
	method durasMasQue(otraCancion){
		return self.duracion()>otraCancion.duracion()
	}
	method sosMasLarga(otraCancion){
		return self.longitudCancion()>otraCancion.longitudCancion()
	}
	method tienenNombresDiferentes(otraCancion){
		return self.nombre()!=otraCancion.nombre()
	}
}

class Remix inherits Cancion{
	var cancion
	constructor(unNombre,unaDuracion,unaLetra,unaCancion)=super(unNombre,unaDuracion,unaLetra){
		cancion=unaCancion
	}
	override method duracion(){
		return cancion.duracion()*3
	}
	override method letra(){
		return "mueve tu cuelpo baby " + cancion.letra() + " yeah oh yeah"
	}
	
}

class Mashup inherits Cancion{
	var canciones
	
	constructor(unNombre,unaDuracion,unaLetra,unasCanciones)=super(unNombre,unaDuracion,unaLetra){
		canciones=unasCanciones
		
	}
	method canciones()=canciones
	override method duracion(){ return self.canciones().max({cancion=>cancion.duracion()})	
	}
	override method letra()= self.canciones().fold("",{primeraCancion, otraCancion =>primeraCancion + " " + otraCancion.letra()}).drop(1)
	}

class Album{
	var nombre
	var diaSalida
	var mesSalida
	var anioSalida
	var canciones
	var unidadesALaVenta
	var unidadesVendidas
	
	constructor(unNombre,unDiaSalida,unMesSalida,unAnioSalida,unasCanciones,unasUnidadesALaVenta,unasUnidadesVendidas){
	nombre=unNombre
	diaSalida=unDiaSalida
	mesSalida=unMesSalida
	anioSalida=unAnioSalida
	canciones=unasCanciones
	unidadesALaVenta=unasUnidadesALaVenta
	unidadesVendidas=unasUnidadesVendidas
	}
	
	method nombre()=nombre
	method canciones()=canciones
	method unidadesSalientes()=unidadesALaVenta
	method unidadesVendidas()=unidadesVendidas
	method duracionAlbum(){return self.canciones().sum({cancion=>cancion.duracion()})
	}
	method albumCorto(){return self.canciones().all({cancion=>cancion.duracion()<180})}
	method cancionMasLarga(){ return self.canciones().max({cancion=>cancion.longitudCancion()})}
	method cancionMasDuradera(){ return self.canciones().max({cancion=>cancion.duracion()})
		
	}
	method tieneCancion(unaCancion)= self.canciones().contains(unaCancion)
}