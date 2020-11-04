import comidas.*
import comensales.*

object cocina{
	var property platos = []
	
	method agregarPlatos(plato){
		platos.add(plato)
	}
	method removerPlatos(plato){
		platos.remove(plato)
	}
	method tieneBuenaOfertaVegetariana(){
		return (self.cantidadDePlatosVegetarianos() - self.cantidadDePlatosNoVegetarianos()) == 2 .abs() 
	}
	method cantidadDePlatosVegetarianos(){
		return platos.filter({p=>p.esAptoVegetariano()}).size()
	}
	method cantidadDePlatosNoVegetarianos(){
		return platos.filter({p=>not p.esAptoVegetariano()}).size()
	}
	method elPlatoFuerteCarnivoro(){
		return platos.max({p=>p.valoracionDeCarne()})
	}
	method listaDeComidasQueLeGustan(comensal){
		return platos.map({p=>comensal.leAgrada(p)})
	}
	method poderElegirPlato(plato,comensal){
		
	}
	
	method cualquierPlato(){
		return platos.anyOne()
	}
}