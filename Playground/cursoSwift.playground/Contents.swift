//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func multiplicar(numero1:Int, numero2:Int) -> Int {
    return numero1*numero2
}

var numero:Int = multiplicar(numero1: 2,numero2: 3)

print(numero)


var valor1:Int
var valor2:Int?
var total:Int = 0

valor2 = 1
valor1 = 10

if let valor2Testado = valor2 {
    total = valor1 + valor2Testado
}

print(total)

class Casa {
    var cor:String
    
    init (cor:String) {
        self.cor = cor
    }
    
    func getCor() -> String {
        return self.cor
    }
}


var casa = Casa(cor: "oi")
casa.getCor()


class Animal {
    var cor = "marrom"
    
    func dormir()-> String {
        return "dormir"
    }
}


class Cachorro:Animal {
    func latir() -> String {
        return "latir"
    }
}

var cachorro = Cachorro()
cachorro.cor
cachorro.latir()




