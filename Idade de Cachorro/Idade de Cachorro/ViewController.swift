//
//  ViewController.swift
//  Idade de Cachorro
//
//  Created by Felipe on 24/04/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var campoIdadeCachorro: UITextField!
    @IBAction func descobrirIdade(_ sender: Any) {
        var idadeCachorro = Int(campoIdadeCachorro.text!)!
        
        idadeCachorro = idadeCachorro*7
        legendaResultado.text = "A idade do cachorro é " + String(idadeCachorro)
        
    }
    @IBOutlet weak var legendaResultado: UILabel!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

