//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var lista = Set<String>()

lista.insert("pizza")
lista.insert("suco")

print(lista)


var animais = [String: String]()
animais["urso"] = "opa"
animais["kkkk"] = "aaaa"

print(animais["urso"]!)


var textos:[String] = []
textos.append("opa")
textos.append("teste")


for var i in 0..<6 {
    print(i)
}

for var texto in textos {
    print(texto)
}


var cont:Int = 0
while (cont<5) {
    print("opa")
    cont += 1
}

