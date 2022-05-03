object neo {
	var energia = 100
	
	method energia() = energia
	method esElElegido()= true
	method saltar(){energia*=0.5}
	method vitalidad(){return energia*0.10}
	
	
}


object morfeo{
	var property vitalidad = 8
	var estaCansado = false
	method estaCansado() = estaCansado
	method esElElegido()= false
	method saltar(){
		estaCansado = not estaCansado
		vitalidad = 0.max(vitalidad-1)
	}
}

object trinity{
	method esElElegido() = false
	method saltar(){}
	method vitalidad() = 0
	
}


object nave{
	var pasajeros = [neo, trinity, morfeo]
	
	method cantidadDePasajeros() = pasajeros.size()
	method estaElElegido()=
		pasajeros.any({p => p.esElElegido()})
	method chocar(){
		pasajeros.forEach({ e => e.saltar()})
		pasajeros.clear()
	}
	method acelerar(){
		pasajeros.filter({e => not e.esElElegido()}).forEach({e => e.saltar()})
	}
	method estaEquilibrada(){
		return self.mayorVitalidad().vitalidad() < self.menorVitalidad().vitalidad()
	}
	method mayorVitalidad() = pasajeros.max({p => p.vitalidad()})
	method menorVitalidad() = pasajeros.min({p => p.vitalidad()})


}

