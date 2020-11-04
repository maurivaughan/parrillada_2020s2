import comidas.*
import cocina.*
class Comensal {
	var property comidas = []
	var property peso = 0
	method leAgrada(unaComida)
	method satisfecho(){
		return comidas.all({c=>c.peso()>=self.peso()*0.01})
	}
	method comer(unaComida)
	
}
class Vegetarianos inherits Comensal{
   override method leAgrada(unaComida){
   	return comidas.all({c=>unaComida.esAptoVegetariano()}) and comidas.all({c=>unaComida.valoracion()>85})
   }
   override method comer(unaComida){
   	   comidas.add(unaComida)
   }
   override method satisfecho(){
   	  return  super() and comidas.all({c=>not c.esAbundante()})
   }
}

class HambrePopular inherits Comensal{
	override method leAgrada(unaComida){
		return comidas.all({c=>unaComida.esAbundante()})
	}
}
class DePaladarFino inherits Comensal{
	override method leAgrada(unaComida){
		return comidas.all({c=>unaComida.peso().between(150,300)}) 
		and comidas.all({c=>unaComida.valoracion()>100})
	}
	override method satisfecho(){
		return super() and comidas.all({c=>self.cantidadDeComidas().even()})
	}
	method cantidadDeComidas(){
		return comidas.size()
	}
}

