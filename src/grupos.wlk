class Grupo {
	var nombre
	var integrantes
	var representante
	var albumesPublicados

	
	constructor(unNombre, losIntegrantes, unRepresentante, albumes){
		nombre = unNombre
		integrantes = losIntegrantes
		representante = unRepresentante
		albumesPublicados = albumes
	}
	
	method nombre() = nombre
	method integrantes() = integrantes
	method representante() = representante
	method albumesPublicados() = albumesPublicados
	method cancionesPublicadas() = return albumesPublicados.flatMap({album => album.canciones()})
	method esDeSuAutoria(cancion) = return self.cancionesPublicadas().contains(cancion)
	method habilidadIntegrantes() = self.integrantes().sum({integrante => integrante.habilidad()}) 
	method habilidad() = return self.habilidadIntegrantes() + self.habilidadIntegrantes()*0.1
	method contieneIntegrante(musico) = self.integrantes().contains(musico)
	method esGrupoSolista() = return self.integrantes().size() == 1
	method cobrar(presentacion) =  self.integrantes().sum({integrante => integrante.cobrar(presentacion)}) + representante.cuantoCobra(presentacion)
	method agregarMusico (musico) {
		integrantes.add(musico)
		}
	method interpretaBien(cancion) = return self.integrantes().all({integrante => integrante.interpretaBien(cancion)})

}

class Representante{
	var sueldo
	
	constructor(unSueldo){
		sueldo = unSueldo
	}
	method cuantoCobra(presentacion) = sueldo
}