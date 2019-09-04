

object alquimista {
  var itemsDeCombate = []
  var itemsDeRecoleccion = []
  method esProfesional(){
  	return self.calidadPromediosDeSusItems() > 50 and self.esBuenExplorador() and self.todosItemsEfectivos()
  }
  method calidadPromedioDeSusItems(){
    (itemsDeCombate.sum({item=>item.calidadDelItem}))/itemsDeCombate.length()
    
    
  method esBuenExplorador(){
  	return self.cantidadDeItemsDeRecoleccion >= 3
  }
  method capacidadOfensiva(){
  	return itemsDeCombate.sum({ itemDeCombate =>
      itemDeCombate.capacidadOfensiva()
    })
  }
  method aniadirItemCombate(itemc){
  	itemsDeCombate.add(itemc)
  }
  
  method aniadirItemDeRecoleccion(itemr){
  	itemsDeRecoleccion.add(itemr)
  }
 
  method cantidadDeItemsDeRecoleccion(){
  	return itemsDeCombate.size()
  }
  method tieneCriterio() {
    return self.cantidadDeItemsDeCombateEfectivos() >= self.cantidadDeItemsDeCombate() / 2
  }
  method todosItemsEfectivos (){
  	return self.cantidadDeItemsDeCombateEfectivos() == self.cantidadDeItemsDeCombate()
  	}
  method cantidadDeItemsDeCombate() {
    return itemsDeCombate.size()
  }
  
  method cantidadDeItemsDeCombateEfectivos() {
    return itemsDeCombate.count({ itemDeCombate =>
      itemDeCombate.esEfectivo()
    })
  }
}

object bomba {
  var danio = 15
  method capacidadOfensiva(){
  	return danio/2
  }
  method esEfectivo() {
    return danio > 100
  }
}

object pocion {
  var materiales = []
  var poderCurativo = 0
  method capacidadOfensiva(){
  	return poderCurativo + self.puntosExtras()
  }
  
  method puntosExtras(){
  	return 10 * self.cantidadDeMaterialesMisticos()
  }
  
  method esEfectivo() {
    return poderCurativo > 50 and self.fueCreadaConAlgunMaterialMistico()
  }
  
  method cantidadDeMaterialesMisticos(){
  	return materiales.count({material => 
  		material.esMistico()
  	})
  }
  method fueCreadaConAlgunMaterialMistico() {
    return materiales.any({ material =>
      material.esMistico()
    })
  }
}

object debilitador {
  var materiales = []
  var potencia = 0
  method esEfectivo() {
    return potencia > 0 and self.fueCreadoPorAlgunMaterialMistico().negate()
  }
  
 method capacidadOfensiva(){
    if(self.fueCreadoPorAlgunMaterialMistico()){
        return 12 * self.cantidadDeMaterialesMisticos()}
        return 5

}
method cantidadDeMaterialesMisticos(){
      return materiales.count({material => 
          material.esMistico()
      })
  }
 
}
  method fueCreadoPorAlgunMaterialMistico() {
    return materiales.any({ material =>
      material.esMistico()
    })
  }

}