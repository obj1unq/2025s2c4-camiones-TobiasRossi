object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
}

object arenaAGranel {

	var pesoActual = null

	method pesoActual(_pesoActual) {
    	pesoActual = _pesoActual
	}

	method peso() = pesoActual
	method nivelPeligrosidad() = 10
}

object bumblebee { /* VER */
	method peso() = 800
	method nivelPeligrosidad() = /*15 AUTO - 30 ROBOT*/1
}

object paqueteDeLadrillos {
	var cantidadDeLadrillos = null

	method cantidadDeLadrillos(_cantidadDeLadrillos) {
    	cantidadDeLadrillos = _cantidadDeLadrillos
	}

	method peso() = 2*cantidadDeLadrillos
	method nivelPeligrosidad() = 2
}

object bateriaAntiaerea {
	var property tieneMisiles = true

	method peso() { if (tieneMisiles) {return 300} return 200}
	method nivelPeligrosidad() { if (tieneMisiles) {return 100} return 0}
}

object residuosRadioactivos {

	var pesoActual = null

	method pesoActual(_pesoActual) {
    	pesoActual = _pesoActual
	}


	method peso() = pesoActual
	method nivelPeligrosidad() = 200
}
