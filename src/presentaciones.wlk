class Presentacion {
    var musicos = []
 
    var dia
    var mes
    var anio
    var criterios
    var capacidad
    constructor(unDia, unMes, unAnio,unosCriterios,unosMusicos,unaCapacidad){
    	
    	dia=unDia
    	mes=unMes
    	anio=unAnio
    	criterios=unosCriterios
    	musicos=unosMusicos
    	capacidad=unaCapacidad
    }
    method cambiarFecha(unDia,unMes,unAnio){dia=unDia
    	mes=unMes
    	anio=unAnio
  }
  	method dia()=dia
  	method mes()=mes
  	method anio()=anio
    method esConcurrida() = self.capacidad() > 5000
    method capacidad() = capacidad
    method musicoCumpleCriterios(musico) = return criterios.forEach({criterio => criterio.musicoCumpleCriterio(musico)})
    method agregarMusico (musico){
		self.musicoCumpleCriterios(musico)
		self.musicos().add(musico)
}
    
    method bandaCumpleCriterios(unGrupo) = return unGrupo.integrantes().forEach({integrante => self.musicoCumpleCriterios(integrante)})
	method agregarBanda(unGrupo){
		self.bandaCumpleCriterios(unGrupo)
		self.musicos().add(unGrupo)
}
    method musicos() = musicos
    method musicos(nuevosMusicos){
        self.musicos().clear()
        self.musicos().addAll(nuevosMusicos)
    }
   
    
   
    method costo() = self.musicos().sum({musico => musico.cobrar(self)})
    method magia() = self.musicos().sum({musico=>musico.habilidad()})
    method soloToca(unMusico) = self.musicos() == [unMusico]
}

class Criterio{
	
	method musicoCumpleCriterio(musico) = true
}

class CriterioPorHabilidad{
	var habilidadNecesaria
	
	constructor(unaHabilidad){
		habilidadNecesaria = unaHabilidad
	}
	
	method musicoCumpleCriterio(musico){
		if(musico.habilidad() < habilidadNecesaria )
			throw new NoCumpleCriterio ("El musico no tiene la habilidad necesaria") 
   		
	}
}
class CriterioPorObra{
	
	method musicoCumpleCriterio(musico){
		if(musico.albunes().isEmpty())
		 	throw new NoCumpleCriterio ("El musico no publico suficientes canciones")
	}
}

class CriterioPorCancion{
	var cancionNecesaria
	constructor(unaCancion){
		cancionNecesaria = unaCancion
	}
	
	method musicoCumpleCriterio(musico){
		if (!musico.interpretaBien(cancionNecesaria))
			throw new NoCumpleCriterio ("El musico no puede interpretar la cancion requerida")
	}
}




class NoCumpleCriterio inherits Exception{}
