object babyCorn {
    
    const property estado = "baby"

    method efectoAlSerRegado(cultivo) {
        cultivo.estado(adultCorn)
    }

    method esCosechable() {
        return false
    }

}

object adultCorn {
    
    const property estado = "adult"

    method efectoAlSerRegado(cultivo) {
    
    }

    method esCosechable() {
        return true
    }

}