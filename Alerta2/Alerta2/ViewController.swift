//
//  ViewController.swift
//  Alerta2
//
//  Created by Felipe on 23/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func abrirAlerta(_ sender: Any) {
        let alertaController = UIAlertController(title: "adicionar contato", message: "deseja adicionar o contato", preferredStyle: .actionSheet)
        let acaoConfirmar = UIAlertAction(title: "confirmar", style: .default, handler: nil)
        let acaoCancelar = UIAlertAction(title: "cancelar", style: .destructive, handler: nil)
        
        alertaController.addAction(acaoConfirmar)
        alertaController.addAction(acaoCancelar)
        present(alertaController, animated: true, completion: nil)
        
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

