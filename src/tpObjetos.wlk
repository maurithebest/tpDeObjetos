class cantante{
	var nombre
	var estado
	var habilidad 
	constructor(unNombre,unEstado,unaHabilidad){
		nombre=unNombre
		estado=unEstado
		habilidad=unaHabilidad
	}
	method nombre()=nombre
	method estado()=estado
	method habilidad()=habilidad
	
}


object joaquin{
	var grupo =[]
	var habilidad = 20
	
	method grupo()=grupo
	method agregarAGrupo(grupoAEntrar){grupo.add(grupoAEntrar)}
	method salirDeGrupo(grupoASalir){grupo.remove(grupoASalir)
		
	}
	
	method habilidad(){if(grupo.size()<1)
		return habilidad
		else return habilidad+5
	}	
	
	method interpretaBien(cancion){
	return cancion.duracion()>300
	}
	
	method cobra(lunaPark){
		if(grupo.size()<1)
		return 100
		else return 50
	}
	
}

object lucia{
	var habilidad=70
	var grupo = []
	
	method grupo()=grupo
	method agregarAGrupo(grupoAEntrar){grupo.add(grupoAEntrar)}
	method salirDeGrupo(grupoASalir){grupo.remove(grupoASalir)
		
	}
	method habilidad(){if(grupo.size()<1)
		return habilidad
		else return habilidad-20
	}	
	
	
	method interpretaBien(cancion){
		return cancion.letra().contains("familia")}
	method cobra(lugar){
		if(lugar.capacidad()>5000)
		return 500
		else return 400
	}
	
}

object luisAlberto{
	var guitarra
	var habilidad
	method tocaGuitarra(guitarraAUsar){
		guitarra=guitarraAUsar
	
	}
	method guitarra()=guitarra
	 method habilidad(){
	 	
	 	habilidad=(self.guitarra().unidadGuitarra()*8).min(100)
	 	return habilidad
	 }
		method tocaEnFecha(dia,mes,anio){
			
		}	
		method cobra(lugar){
		
		if(lugar.mesRecital()<9&&lugar.anioRecital()<=2017)
		return 1000
		else return 1200
	
	}	
		method interpretaBien(cancion)=true
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

object lunaPark {
	var personasQueTocan=[joaquin,lucia,luisAlberto]
	var diaRecital=20
	var mesRecital =4
	var anioRecital =2017
	
	var capacidad = 9290
	method diaRecital()=diaRecital
	method mesRecital()=mesRecital
	method anioRecital()=anioRecital
	method personasQueTocan()=personasQueTocan
	method tienenQuePagar(){
		return personasQueTocan.sum({persona=>persona.cobra(self)})
	}
	method capacidad()=capacidad
	
	
}

object laTrastienda{
	var personasQueTocan=[joaquin,lucia,luisAlberto]
	var diaRecital=15
	var mesRecital =11
	var anioRecital =2017
	var capacidad =400 
	
	method diaRecital()=diaRecital
	method mesRecital()=mesRecital
	method anioRecital()=anioRecital
	method personasQueTocan()=personasQueTocan
	method tienenQuePagar(){
		return personasQueTocan.sum({persona=>persona.cobra(self)})
	}
	
	method capacidad()=capacidad
	
	
}

object cisne{
	var duracion=312
	var letra=["hoy","el","viento","se","abrio","quedo","vacio","el","aire","una","vez","mas","y","el","manantial","broto","y","nadie","esta","aqui","y","puedo","ver","que","solo","estallan","las","hojas","al","brillar"]
	method letra()=letra
	method duracion()=duracion
}
object laFamilia{
	var duracion=264
	var letra=["quiero","brindar","por","mi","gente","sencilla","por","el","amor","brindo","por","la","familia"]
		method letra()=letra
	method duracion()=duracion
}
