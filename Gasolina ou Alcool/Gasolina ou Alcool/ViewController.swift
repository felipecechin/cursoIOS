//
//  ViewController.swift
//  Gasolina ou Alcool
//
//  Created by Felipe on 02/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var precoAlcoolTextField: UITextField!
    @IBOutlet weak var precoGasolinaTextField: UITextField!
    @IBOutlet weak var resultado: UILabel!
    
    @IBAction func calcularCombustivel(_ sender: Any) {
        var precoAlcool: Double = 0
        var precoGasolina: Double = 0
        var resultadoPreco: Double = 0
        
        if let resultadoAlcool = precoAlcoolTextField.text {
            if resultadoAlcool != "" {
                if let resultadoNumero = Double(resultadoAlcool) {
                    precoAlcool = resultadoNumero
                }
            }
        }
        if let resultadoGasolina = precoGasolinaTextField.text {
            if resultadoGasolina != "" {
                if let resultadoNumero = Double(resultadoGasolina) {
                    precoGasolina = resultadoNumero
                }
            }
        }
        
        if precoAlcool/precoGasolina >= 0.7 {
            resultado.text = "Melhor usar gasolina!"
        } else {
            resultado.text = "Melhor usar álcool"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

