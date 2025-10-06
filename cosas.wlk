object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
	method bulto() = 1
}

object arenaAGranel {

	var pesoActual = null

	method pesoActual(_pesoActual) {
		pesoActual = _pesoActual
	}

	method peso() = pesoActual
	method nivelPeligrosidad() = 10
	method bulto() = 1
}

object bumblebee {
    var property estaTransformadoEnAuto = true

	method peso() = 800
    method nivelPeligrosidad() {if(estaTransformadoEnAuto) 15 else 30}
	method bulto() = 2
}	

object paqueteDeLadrillos {
	var cantidadDeLadrillos = null
	const pesoPorLadrillo = 2

	method cantidadDeLadrillos(_cantidadDeLadrillos) {
		cantidadDeLadrillos = _cantidadDeLadrillos
	}

	method peso() = pesoPorLadrillo * cantidadDeLadrillos
	method nivelPeligrosidad() = 2

	method bulto() { return if (cantidadDeLadrillos <= 100) 1 else if (cantidadDeLadrillos <= 300) 2 else 3}
}

object bateriaAntiaerea {
	var property tieneMisiles = true

	method peso() { if (tieneMisiles) 300 else 200}
	method nivelPeligrosidad() { if (tieneMisiles) 100 else 0}
	method bulto() {return if (tieneMisiles) 2 else 1} 
}

object residuosRadioactivos {

	var pesoActual = null

	method pesoActual(_pesoActual) {
		pesoActual = _pesoActual
	}


	method peso() = pesoActual
	method nivelPeligrosidad() = 200
	method bulto() = 1
}

object contenedorPortuario {
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

	method cosasDentro() {
        return cosas
    }

	const pesoContenedor = 100
	const bultoContenedor = 1

	method peso() {
		return self.cosasDentro().sum({cosa => cosa.peso()}) + pesoContenedor
	}

	method nivelPeligrosidad() { return
		if (self.cosasDentro().isEmpty()) 0 else self.cosasDentro().map({cosas => cosas.nivelPeligrosidad()}).max()
	}

	method bulto() = self.cosasDentro().sum({cosa => cosa.bulto()}) + bultoContenedor
}

object embalajeDeSeguridad {
	var cosaEnvuelta = null

	method envolver(cosa) {
		if (cosaEnvuelta != null) {
			throw new Exception(message = "Solo se envuelve una cosa a la vez")
		} cosaEnvuelta = cosa
	}

	method desenvolver(cosa) {
		if (cosaEnvuelta == null) {
			throw new Exception(message = "No hay nada envuelto")
		} cosaEnvuelta = null
	}

	method peso() {
        if (cosaEnvuelta == null) {
            return 0
        }
        return cosaEnvuelta.peso()
    }

    method nivelPeligrosidad() {
        if (cosaEnvuelta == null) {
            return 0
        }
        return cosaEnvuelta.nivelPeligrosidad() / 2 
    }

	method bulto() = 2
}
