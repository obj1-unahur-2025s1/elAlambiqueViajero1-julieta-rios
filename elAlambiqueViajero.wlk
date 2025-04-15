import bolichito-julieta-rios.objetos.*
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
    method tieneCombustible() = combustible >= consumoPorViaje
    method consumirCombustible() {
        combustible = combustible - consumoPorViaje
    }
    method rapido() = rapido
}

object antiguallaBlindada {
    var rapido = gangster <= 3
    var combustible = 30
    var consumoPorViaje = 7 * gangster
    var gangster = 2

    method tieneCombustible() = combustible >= consumoPorViaje
    method rapido() = rapido
    method combustible() = combustible
    method consumoPorViaje() = consumoPorViaje

    method consumirCombustible() {
        combustible combustible - consumoPorViaje
    }

    method cambiarGangster(numero) {
        gangster = gangster + numero
    }
}

object superConvertible {
    var vehiculoConvertido = alambiqueVeloz
    var rapido = vehiculoConvertido.rapido()
    var combustible = vehiculoConvertido.combustible()
    var consumoPorViaje = vehiculoConvertido.consumoPorViaje()


    method tieneCombustible() = combustible >= consumoPorViaje
    method rapido() = rapido
    method combustible() = combustible
    method consumoPorViaje() = consumoPorViaje

    method consumirCombustible() {
        combustible -= consumoPorViaje
    }

    method cambiarVehiculoConvertido(nuevo) {
        vehiculoConvertido = nuevo
    }
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
    method puedeLlegar(vehiculo) = vehiculo.rapido() && vehiculo.tieneCombustible()
}

object moto{
    method rapido() = true
    method tieneCombustible() = not self.rapido()
    method consumirCombustible() { }
}