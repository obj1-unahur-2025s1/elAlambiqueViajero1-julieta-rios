object luke{
    var cantidadViajes = 0
    var recuerdo = null
    var vehiculo = alambiqueVeloz

    method cantidadViajes() = cantidadViajes 

    method viajar(lugar){
        if (lugar.puedeLlegar(vehiculo)) {
            cantidadViajes = cantidadViajes + 1
            recuerdo = lugar.recuerdoTipico()
            vehiculo.consumirCombustible()
        }
    }
    method recuerdo() = recuerdo
    method vehiculo(nuevo) {vehiculo = nuevo}
}

//----Vehiculos----
object alambiqueVeloz {
    var rapido = true
    var combustible = 20
    const consumoPorViaje = 10
    var patente = "AB123JK"
    //method combustible() = combustible
    //method consumoPorViaje() = consumoPorViaje
    method tieneCombustible() = combustible >= consumoPorViaje
    method consumirCombustible() {
        combustible = combustible - consumoPorViaje
    }
    method rapido() = rapido
    method patenteValida() = patente.head() == "A"
}

object antiguallaBlindada {
    var gangster = 7
    method rapido() = gangster > 6
    method tieneCombustible() = gangster.even()
    method consumirCombustible() {
        gangster = gangster - 1
    }
    method patenteValida() = self.rapido()
}

object chatarra {
    var cañones = 10
    var municiones = "ACME"
    method rapido() = municiones.size() < cañones
    method tieneCombustible() = municiones == "ACME" and cañones.between(6,12)
    method consumirCombustible() {
        cañones = (cañones / 2).roundUp(0)
        if(cañones < 5)
            municiones = municiones + "Obsoleto"
    }
    method patenteValida() = municiones.take(4) == "ACME"
}

object superConvertible {
    var vehiculoConvertido = alambiqueVeloz
    method rapido() = vehiculoConvertido.rapido()
    method tieneCombustible() = vehiculoConvertido.tieneCombustible()
    method consumirCombustible() = vehiculoConvertido.consumirCombustible()

    method convertir(nuevo) {
        vehiculoConvertido = nuevo
    }
    method patenteValida() = vehiculoConvertido.patenteValida()
}

object moto{
    method rapido() = true
    method tieneCombustible() = not self.rapido()
    method consumirCombustible() { }
    method patenteValida() = false
}


//----Destinos----
object paris{
    method recuerdoTipico() = "Llavero Torre Eiffel"
    method puedeLlegar(vehiculo) =  vehiculo.tieneCombustible() 
}

object buenosAires{
    method recuerdoTipico() = "Mate"
    method puedeLlegar(vehiculo) =  vehiculo.rapido() 
}

object bagdad {
    var recuerdo = "Bidon de petroleo"
    method recuerdoTipico() = recuerdo
    method recuerdo(nuevo) {recuerdo = nuevo}
    method puedeLlegar(vehiculo) = true
}

object lasVegas{
    var homenaje = paris
    method homenaje(lugar) {homenaje = lugar}
    method recuerdoTipico() = homenaje.recuerdoTipico()
    method puedeLlegar(vehiculo) = homenaje.puedeLlegar(vehiculo)
}

object grecia{
    method recuerdoTipico() = "Ceramica"
    method puedeLlegar(vehiculo) = vehiculo.rapido() && vehiculo.tieneCombustible() && vehiculo.patenteValida()
}