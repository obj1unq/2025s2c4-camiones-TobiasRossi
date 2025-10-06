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

	method hayCosaCargadaPesa(peso) {
		return self.cosasCargadas().any({cosa => cosa.peso() == peso})
	}

	method pesoTotalDelCamion() {
		const pesoTara = 1000

		return self.cosasCargadas().sum({cosa => cosa.peso()}) + pesoTara
	}

	method excesoDePeso() {
		const pesoMaximo = 2500
		return self.pesoTotalDelCamion() > pesoMaximo
	}

	method hayCosaCargadaConPeligrosidad(peligro) {
		return self.cosasCargadas().any({cosa => cosa.nivelPeligrosidad() == peligro})
	}

	method cosasMasPeligrosasQue(peligro) {
		return self.cosasCargadas().filter({ cosa => cosa.nivelPeligrosidad() > peligro})
	}

	method cosasMasPeligrosasQueOtra(otraCosa) {
		return self.cosasMasPeligrosasQue(otraCosa.nivelPeligrosidad())
	}

	method esAptoParaRuta(nivel) {
		return not self.excesoDePeso() && self.cosasMasPeligrosasQue(nivel).isEmpty()
	}

	method hayAlgoCargadoQuePesaEntre(minimo,maximo) {
		return self.cosasCargadas().any({cosa => cosa.peso() >= minimo && cosa.peso() <= maximo})
	}

	method cosaCargadaMasPesada() {
		try {
			return self.cosasCargadas().max({ cosa => cosa.peso() })}
		catch e: wollok.lang.ElementNotFoundException {
			throw new Exception(message = "No se puede calcular el elemento mas pesado porque el camion está vacio")
		}
	}

	method listaDePesosDeCosasCargadas() {
		return self.cosasCargadas().map({cosa => cosa.peso()})
	}
}

