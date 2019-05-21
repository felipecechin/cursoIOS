//
//  ViewController.swift
//  Passando dados entre views
//
//  Created by Felipe on 21/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    var textoRecebido:String!
    @IBOutlet weak var resultadoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultadoLabel.text = textoRecebido
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

