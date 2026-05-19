import personaje.*
import wollok.game.*
import estadosDeCultivos.*


class Maiz {

	var property estado = babyCorn

	var property position = game.at(1, 1)

	method esCultivo() {
		return true
	}

	method serVendida(){
		personaje.agregarMonedas(150)
	}

	method image() {
		return "corn_"+estado.estado()+".png"
	}

	method serSembradaEn(posicion) {
		position = posicion
	}

	method serCosechada() {
		if(estado.esCosechable()){
			personaje.añadirPlantaAInventario(self)
			game.removeVisual(self)
		}
	}

	method serRegada() {
		estado.efectoAlSerRegado(self)
	}
}

class Trigo {

	var property position = game.at(1, 1)

	var property estado = 0

	method esCultivo() {
		return true
	}

	method serVendida(){
		personaje.agregarMonedas((estado - 1) * 100)
	}

	method image() {
		return "wheat_"+estado+".png"
	}

	method serRegada() {
		if (estado == 3){
			estado = 0
		} else {
			estado = estado + 1
		}
	}

	method serSembradaEn(posicion) {
		position = posicion
	}

	method serCosechada() {
		if(estado>=2){
			personaje.añadirPlantaAInventario(self)
			game.removeVisual(self)
		}
	}

}

class Tomaco {
	const estado = "tomaco.png"

	var property position = game.at(1,1) 


	method esCultivo() {
		return true
	}

	method serCosechada() {
		personaje.añadirPlantaAInventario(self)
		game.removeVisual(self)  
	}

	method image() {
		return estado
	}

	method serRegada() {
		const ejeXActual = position.x()
		if(self.estaEnBordeSuperior()){
			position = game.at(ejeXActual, 0)
		}else{
			const ejeYActual = position.y()
			position = game.at(ejeXActual, ejeYActual+1)
		}
	}

	method serVendida() {
		personaje.agregarMonedas(80)
	}

	method estaEnBordeSuperior() {
		return	position.y() == 9
	}

	method serSembradaEn(posicion) {
		position = posicion
	}

}