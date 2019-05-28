//
//  ViewController.swift
//  Minhas Anotações
//
//  Created by Felipe on 27/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let minhaAnotacaoChave = "anotacoes"
    @IBOutlet weak var textoTextView: UITextView!
    @IBAction func salvar(_ sender: Any) {
        if let texto = textoTextView.text {
            UserDefaults.standard.set(texto, forKey: minhaAnotacaoChave)
            view.endEditing(true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let texto = UserDefaults.standard.object(forKey: minhaAnotacaoChave)
        if let preenchido = texto {
            textoTextView.text = preenchido as! String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        get{
            return true
        }
    }
    
    func esconderTeclado() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.esconderTeclado()
    }


}

