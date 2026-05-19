import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	var property plantasEnInventario = []
	var property monedas = 0

	method esCultivo() {
		return false
	}

	method agregarMonedas(cantidad) {
		monedas = monedas + cantidad
	}

	method cantidadDePlantasYMonedas() {
	  game.say(self, "Tengo "+self.cantidadDePlantas()+" plantas y "+monedas+" monedas")
	}

	method cantidadDePlantas() {
		return plantasEnInventario.size()
	}

	method venderTodo() {
		plantasEnInventario.forEach({planta => planta.serVendida()})
		plantasEnInventario.clear()
	}

	method esCosechable() {
		return false
	}

	method serCosechada() {
		
	}

	method añadirPlantaAInventario(cultivo){
		plantasEnInventario.add(cultivo)
	}

	method serRegada() {
	  
	}

	method cosechar() {
		self.validarInteraccionConPlanta()
		self.objetosEnMiCuadrilla().forEach({elemento => elemento.serCosechada()})
	}



	method sembrar(cultivo) {
		cultivo.serSembradaEn(position)
		game.addVisual(cultivo)
	}

	method regar() {
		self.validarInteraccionConPlanta()
		self.objetosEnMiCuadrilla().forEach({elemento => elemento.serRegada()})

	}

	method validarInteraccionConPlanta(){
		if(!self.hayCultivosEnMiCuadrilla()){
			self.error("No hay ninguna planta aca")
		}
	}

	method objetosEnMiCuadrilla() {
		return game.getObjectsIn(position)
	}

	method hayCultivosEnMiCuadrilla() {
		return self.objetosEnMiCuadrilla().any({elemento => elemento.esCultivo()})
	}

}