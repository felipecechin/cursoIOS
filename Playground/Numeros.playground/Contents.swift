//: Playground - noun: a place where people can play

import UIKit
import Foundation

let numero = "1200,15"
let nf = NumberFormatter()

nf.numberStyle = .decimal
nf.locale = Locale(identifier: "pt_BR")

if let resultado = nf.number(from: numero) {
    let total = Double(resultado)
    let total2 = total + 1
}



