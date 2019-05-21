//
//  ViewController.swift
//  Passando dados entre views
//
//  Created by Felipe on 21/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviarDadosDetalhes" {
            let viewControllerDestino = segue.destination as! DetalhesViewController
            viewControllerDestino.textoRecebido = nomeTextField.text
        }
    }


}

