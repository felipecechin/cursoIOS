//
//  ViewController.swift
//  Minhas tarefas
//
//  Created by Felipe on 28/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var tarefas:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        atualizarTarefas()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let tarefaUserDefaults = TarefaUserDefaults()
            tarefaUserDefaults.removerTarefa(indice: indexPath.row)
            atualizarTarefas()
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        atualizarTarefas()
        tableView.reloadData()
    }
    
    func atualizarTarefas(){
        let tarefaUserDefaults = TarefaUserDefaults()
        tarefas = tarefaUserDefaults.listarTarefas()

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = tarefas[indexPath.row]
        
        return celula
        
    }



}

