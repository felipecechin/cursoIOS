//
//  TarefaViewController.swift
//  Minhas tarefas
//
//  Created by Felipe on 28/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class TarefaViewController: UIViewController {

    @IBOutlet weak var tarefaText: UITextField!
    @IBAction func adicionarTarefa(_ sender: Any) {
        if let texto = tarefaText.text {
            let tarefaUserDefaults = TarefaUserDefaults()
            tarefaUserDefaults.adicionarTarefa(tarefa: texto)
            tarefaText.text = ""
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

}
