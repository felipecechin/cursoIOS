//
//  ViewController.swift
//  Salvar Dados Usuario
//
//  Created by Felipe on 27/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //UserDefaults.standard.set("azul", forKey: "corFundo")
        
        //let texto = UserDefaults.standard.object(forKey: "corFundo")
        //print(texto)
        
        //var array:[String] = ["Lasanha", "Pizza", "Torta"]
        //UserDefaults.standard.set(array, forKey: "comidas")
        
        UserDefaults.standard.removeObject(forKey: "comidas")
        
        //let arrayRecuperado = UserDefaults.standard.object(forKey: "comidas")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

