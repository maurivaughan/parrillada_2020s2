class Comida {
	
	method peso()
	method valoracion()
	method esAptoVegetariano()	
	method esAbundante(){
		return self.peso()> 250
	} 
	method valoracionDeCarne(){
		if (not self.esAptoVegetariano()){self.valoracion() }
		return self.valoracion()
	}
}

class Provoleta inherits Comida{
	var property peso
	var property especias
	
	 override method esAptoVegetariano(){
	 	return not especias
	 }
	 
	 method esEspecial(){
	 	return self.esAbundante() or self.especias()
	 }
	 override method valoracion(){
	 	if (self.esEspecial()){return 120}else {return 80}
	 }
}
class HamburguesaDeCarne inherits Comida{
	var property pan
	
	override method peso(){
		return 250
	}
	override method esAptoVegetariano(){
		return false
	}
	override method valoracion(){
		return 60 + pan.puntos()
	}
	
}
class HamburguesasVegetarianas inherits HamburguesaDeCarne{
	var property legumbre
	var valoracion = 0
	
	override method esAptoVegetariano(){
		return true
	}
	override method valoracion(){
		valoracion = (2*self.cantidadDeLetras())
		return valoracion.min(17)
	}
	
	method cantidadDeLetras(){
		return legumbre.size()
	}
	
}

class Parrillada inherits Comida{
	var property cortes = []
	var valoracion = 0
	
	method agregarCortes(corte){
		cortes.add(corte)
	}
	
	override method peso(){
		return cortes.sum({c=>c.peso()})
	}
	
	override method esAptoVegetariano(){
		return false
	}
	override method valoracion(){
		valoracion = (15 * self.maximoValor()) - cortes.size()
        return valoracion.max(0)
	}
	method maximoValor(){
		return cortes.map({c=>c.calidad()}).max()
	}
}

object industrial{
	const puntos = 0
	
	method puntos(){
		return puntos
	}
}
object casero{
	const puntos = 20
	
	method puntos(){
		return puntos
	}
}
object masaMadre{
	const puntos = 45
	
	method puntos(){
		return puntos
	}
}
class Cortes{
	var property nombre
	var property calidad
	var property peso 
}



