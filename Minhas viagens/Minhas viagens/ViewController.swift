//
//  ViewController.swift
//  Minhas viagens
//
//  Created by Felipe on 29/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var viagens:[Dictionary<String,String>] = []
    var controleNavegacao = "adicionar"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        atualizarViagens()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viagens.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let viagensUserDefaults = ViagensUserDefaults()
            viagensUserDefaults.removerViagem(indice: indexPath.row)
            atualizarViagens()
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        controleNavegacao = "adicionar"
        atualizarViagens()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.controleNavegacao = "listar"
        performSegue(withIdentifier: "verLocal", sender: indexPath.row)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verLocal" {
            let viewControllerDestino = segue.destination as! MapaViagemViewController
            if self.controleNavegacao == "listar" {
                if let indiceR = sender {
                    let indice = indiceR as! Int
                    viewControllerDestino.viagem = viagens[indice]
                    viewControllerDestino.indiceSelecionado = indice
                    
                }
            } else {
                viewControllerDestino.viagem = [:]
                viewControllerDestino.indiceSelecionado = -1
            }
        }
    }
    
    func atualizarViagens(){
        let viagensUserDefaults = ViagensUserDefaults()
        viagens = viagensUserDefaults.listarViagens()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = viagens[indexPath.row]["local"]
        
        return celula
        
    }

    

}

