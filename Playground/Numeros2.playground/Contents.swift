//: Playground - noun: a place where people can play

import UIKit
import Foundation

let numero = NSNumber(value: 1000.20)

let nf = NumberFormatter()
nf.numberStyle = .decimal
nf.groupingSeparator = "."
nf.decimalSeparator = ","

if let resultado = nf.string(from: numero) {
    print(resultado)
}
