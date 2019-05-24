//
//  ViewController.swift
//  Signos
//
//  Created by Felipe on 23/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var dados:[String] = []
    var significado:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dados.append("Aries")
        dados.append("Cancer")
        dados.append("Leão")
        
        significado.append("aries significado")
        significado.append("cancer significado")
        significado.append("leao significado")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = dados[indexPath.row]
        
        
        
        return celula
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alertaController = UIAlertController(title: "sobre o signo", message: significado[indexPath.row], preferredStyle: .alert)
        let acaoConfirmar = UIAlertAction(title: "confirmar", style: .default, handler: nil)
        
        alertaController.addAction(acaoConfirmar)
        present(alertaController, animated: true, completion: nil)
    }
    
    
}


