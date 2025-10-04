import cosas.*

object camion {
	const property cosas = #{} 

	method cargar(unaCosa) {
		if(cosas.contains(unaCosa)){
            throw new Exception(message = "La cosa ya estaba cargada")
        }
    	cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
        if (!cosas.contains(unaCosa)) {
            throw new Exception(message = "La cosa no estaba cargada")
        }
		cosas.remove(unaCosa)
	}

	method cosasCargadas() {
        return cosas
    }

	method pesoTotalPar() {
		const pesoTotal = cosas.sum({cosa => cosa.peso()})

		return pesoTotal.even()
	}
}
