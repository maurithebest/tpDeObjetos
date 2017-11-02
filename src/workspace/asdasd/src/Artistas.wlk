
class Artista{
	var nombre
	var grupo=[]
	var estado
	var habilidad 
	var criterioDeCobro
	var albunes
	var tipo
	constructor(unNombre,unEstado,unaHabilidad,unCriterioDeCobro,unosAlbunes,unTipo){
		nombre=unNombre
		estado=unEstado
		habilidad=unaHabilidad
		criterioDeCobro=unCriterioDeCobro
		albunes=unosAlbunes
		tipo=unTipo
	}

	method estado()=estado
	method tipo()=tipo
	method cambiarTipo(nuevoTipo){tipo=nuevoTipo}
	method habilidadSola()=habilidad
	method criterioDeCobro()=criterioDeCobro
	method grupo()=grupo
	method agregarAGrupo(grupoAEntrar){grupo.add(grupoAEntrar)
										self.cambiarEstado(new MusicoDeGrupo(-20))
										
	}
	method cambiarEstado(unEstado){estado=unEstado}
	method salirDeGrupo(grupoASalir){grupo.remove(grupoASalir)
		
	}
	method cambiarCriterioDeCobro(nuevoCriterio){criterioDeCobro=nuevoCriterio}
	method albunes()=albunes
	method habilidad()=self.estado().habilidad(self.habilidadSola())
	method habilidad(nuevaHabilidad){habilidad=nuevaHabilidad}
	method interpretaBien(unaCancion)= self.estado().laInterpretaBien(unaCancion)|| self.habilidad()>80 || self.albunes().any({albun=>albun.tieneCancion(unaCancion)})||self.tipo().laInterpretaBien(unaCancion)
	method cobrar(presentacion){return self.criterioDeCobro().cobrar(presentacion,self)}
	method esMinimalista(){return self.albunes().all({albun=>albun.albumCorto()})}
	method duracionDeAlbunes(){return self.albunes().sum({albun=>albun.duracionAlbum()})}
	method totalUnidadesSalidas(){return self.albunes().sum({albun=>albun.unidadesSalidas()})}
	method totalUnidadesVendidas(){return self.albunes().sum({albun=>albun.unidadesVendidas()})}
	method laPego(){return self.totalUnidadesVendidas()>self.totalUnidadesSalidas()*0.75}
	method puedeTocarBien(canciones){return canciones.filter({cancion=>self.interpretaBien(cancion)})}
}
class MusicoDeGrupo {
    const cuantoAumentaLaHabilidad
    constructor(cuantoAumenta){
        cuantoAumentaLaHabilidad = cuantoAumenta
    }
    method cuantoAumentaLaHabilidad() = cuantoAumentaLaHabilidad
    
    method habilidad(habilidadBase) = habilidadBase + self.cuantoAumentaLaHabilidad()
    
    method laInterpretaBien(unaCancion) = unaCancion.duracion() > 300
   
   }

class Solista {
    const palabraParaInterpretarBien
    constructor(unaPalabraParaInterpretarBien){
        palabraParaInterpretarBien = unaPalabraParaInterpretarBien
    }
    
    method palabraParaInterpretarBien() = palabraParaInterpretarBien
    
    method habilidad(habilidadBase) = habilidadBase
    
    method laInterpretaBien(unaCancion) = unaCancion.letra().words().contains(self.palabraParaInterpretarBien())
    
    
    }

class LuisAlberto{
		var guitarra
	constructor(unaGuitarra){guitarra=unaGuitarra}	
		
	
	
	
	
	method laInterpretaBien(unaCancion)=true
	
	method guitarra()=guitarra
	method habilidad(unaHabilidad){
	 	
	 	return (self.guitarra().unidadGuitarra()*8).min(100)
	 	
	 }
}

class Palabreros{
	var palabra
	constructor(unaPalabra){palabra=unaPalabra}
	method palabra()=palabra
	method laInterpretaBien(unaCancion) = unaCancion.letra().words().contains(self.palabra())
    
    
}
class Largueros{
	var segundos
	constructor(unosSegundos){segundos=unosSegundos}
	method segundos()=segundos
	method laInterpretaBien(unaCancion) = unaCancion.duracion()>self.segundos()
    
}

class Impareros{
	method laInterpretaBien(unaCancion)=unaCancion.duracion().odd()
}




class PorCapacidad {
	var capacidad
	var dinero
	constructor(unaCapacidad,unDinero){
		capacidad=unaCapacidad
		dinero=unDinero
	}
	
	method cobrar(presentacion,musico){
	if(presentacion.capacidad()>capacidad)
		return dinero
		else return dinero-100}
}
class CantidadEnGrupo {
	var dinero
	constructor(unDinero){dinero=unDinero}
	method dinero()=dinero
	method cobrar(presentacion,musico){
		
			if(presentacion.soloToca(musico)){
				return dinero}
				else return dinero/2
			
		
	}
}
class FechaConcierto {
	var dinero
	var dia
	var mes
	var anio
	var inflacion
		constructor(unDinero,unDia,unMes,unAnio,unaInflacion){dinero=unDinero
			dia=unDia
			mes=unMes
			anio=unAnio
			inflacion=unaInflacion
		}
		method cobrar(presentacion,musico){
		
		if(new Date(dia,mes,anio)>new Date(presentacion.dia(),presentacion.mes(),presentacion.anio()))
		return dinero
		else return dinero*inflacion
	
	}	
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