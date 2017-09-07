class Artista{
	
	var grupo=[]
	var estado
	var habilidad 
	const criterio
	var criterioDeCobro
	var albunes
	constructor(unEstado,unaHabilidad,unCriterio,unCriterioDeCobro,unosAlbunes){
		
		estado=unEstado
		habilidad=unaHabilidad
		criterio=unCriterio
		criterioDeCobro=unCriterioDeCobro
		albunes=unosAlbunes
	}

	method estado()=estado
	method criterio()=criterio
	method habilidadSola()=habilidad
	method criterioDeCobro()=criterioDeCobro
	method grupo()=grupo
	method agregarAGrupo(grupoAEntrar){grupo.add(grupoAEntrar)}
	method salirDeGrupo(grupoASalir){grupo.remove(grupoASalir)
		
	}
	method albunes()=albunes
	method habilidad()=self.estado().habilidad(self.habilidadSola())
	
	method interpretaBien(unaCancion){return self.criterio().laInterpretaBien(unaCancion)}
	method cobrar(lugar){return self.criterioDeCobro().cobrar(lugar,self.grupo().size())}
	method esMinimalista(){return self.albunes().all({albun=>albun.albumCorto()})}
	method duracionDeAlbunes(){return self.albunes().sum({albun=>albun.duracionAlbum()})}
	method totalUnidadesSalidas(){return self.albunes().sum({albun=>albun.unidadesSalidas()})}
	method totalUnidadesVendidas(){return self.albunes().sum({albun=>albun.unidadesVendidas()})}
	method laPego(){return self.totalUnidadesVendidas()>self.totalUnidadesSalidas()*0.75}
	method cambiarEstado(nuevoEstado){estado=nuevoEstado}
	method tienePalabraCanciones(palabra){
		return self.albunes().filter({albun=>albun.tienePalabraCanciones(palabra)})
	}
}
class Cantante inherits Artista{
	
	
}
class Guitarrista inherits Artista{
		var guitarra
	
	method tocaGuitarra(guitarraAUsar){
		guitarra=guitarraAUsar
	
	}
	method guitarra()=guitarra
	 override method habilidad(){
	 	
	 	habilidad=(self.guitarra().unidadGuitarra()*8).min(100)
	 	return habilidad
	 }
}
class Estado{
	method habilidad(unaHabilidad)
}
class EnGrupo inherits Estado{
	var modificador
	constructor(unModificador){
		modificador=unModificador
	}
	method modificador()=modificador
	override method habilidad(unaHabilidad)=unaHabilidad+self.modificador()
}
class Solista inherits Estado{
	override method habilidad(unaHabilidad)=unaHabilidad
}
class CriterioDeCobro{
	method cobrar(lugar,cantidad)
}
class PorCapacidad inherits CriterioDeCobro{
	override method cobrar(lugar,capacidad){
	if(lugar.capacidad()>5000)
		return 500
		else return 400}
}
class CantidadEnGrupo inherits CriterioDeCobro{
	override method cobrar(lugar,cantidad){
		if(cantidad<0)
		return 100
		else return 50
	}
}
class FechaConcierto inherits CriterioDeCobro{
	override method cobrar(lugar,cantidad){
		
		if(lugar.mesRecital()<9&&lugar.anioRecital()<=2017)
		return 1000
		else return 1200
	
	}	
}
class Criterio{
	method laInterpretaBien(unaCancion)
		
}

class DuraMasDe300Segundos inherits Criterio {
	override method laInterpretaBien(unaCancion){
		return unaCancion.duracion()>300
	}
}
class TienePalabraEspecificaLaCancion inherits Criterio{
	var palabra
	constructor(unaPalabra){
		palabra=unaPalabra
	}
	method palabra()=palabra
	override method laInterpretaBien(unaCancion){
		return unaCancion.letra().contains(self.palabra())
	}
}
class DiosDeLaMusica inherits Criterio{
	override method laInterpretaBien(unaCancion)=true
}


	

		
object fender{
	var unidadGuitarra=10
	method unidadGuitarra()=unidadGuitarra
	}
object gibson{
	var estado
	var unidadGuitarra
	method estadoMalo(){estado="malo"}
	method estadoBuena(){estado="bueno"}
	method estado()=estado
	method unidadGuitarra(){
		if (self.estado()=="bueno"){
		unidadGuitarra=15
		return unidadGuitarra}
		else{ unidadGuitarra=5
			return unidadGuitarra
		}
		
	}
}
class Lugar{
	var personasQueTocan
	var diaRecital
	var mesRecital
	var anioRecital
	var capacidad
	constructor(unasPersonasQueTocan,unDiaRecital,unMesRecital,unAnioRecital,unaCapacidad){
		personasQueTocan=unasPersonasQueTocan
		diaRecital=unDiaRecital
		mesRecital=unMesRecital
		anioRecital=unAnioRecital
		capacidad=unaCapacidad
	}
	method diaRecital()=diaRecital
	method mesRecital()=mesRecital
	method anioRecital()=anioRecital
	method personasQueTocan()=personasQueTocan
	method capacidad()=capacidad
	method tienenQuePagar(){
		return personasQueTocan.sum({persona=>persona.cobrar(self)})
	}
}



class Cancion{
	
	var duracion
	var letra
	constructor(unaDuracion,unaLetra){
		
		duracion=unaDuracion
		letra=unaLetra
	}
	
	method letra()=letra
	method duracion()=duracion
	method esCorta(){return self.duracion()<180}
	method longitudCancion(){
		return self.letra().size()
	}
	method tienePalabra(palabra){
		return self.letra().contains(palabra)
	}
}

class Album{
	
	var diaSalida
	var mesSalida
	var anioSalida
	var canciones
	var unidadesALaVenta
	var unidadesVendidas
	
	constructor(unDiaSalida,unMesSalida,unAnioSalida,unasCanciones,unasUnidadesALaVenta,unasUnidadesVendidas){
	
	diaSalida=unDiaSalida
	mesSalida=unMesSalida
	anioSalida=unAnioSalida
	canciones=unasCanciones
	unidadesALaVenta=unasUnidadesALaVenta
	unidadesVendidas=unasUnidadesVendidas
	}
	
	method tienePalabraCanciones(palabra){
		return self.canciones().filter({cancion=>cancion.tienePalabra(palabra)})
	}
	method canciones()=canciones
	method unidadesSalientes()=unidadesALaVenta
	method unidadesVendidas()=unidadesVendidas
	method duracionAlbum(){return self.canciones().sum({cancion=>cancion.duracion()})
	}
	method albumCorto(){return self.canciones().all({cancion=>cancion.duracion()<180})}
	method cancionMasLarga(){ return self.canciones().sortBy({cancion=>cancion.letra().max()}).head()
		
	}
}