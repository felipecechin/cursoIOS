//
//  ListaAnotacaoViewController.swift
//  Notas diarias
//
//  Created by Felipe on 02/06/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import CoreData

class ListaAnotacaoViewController: UITableViewController {
    
    var gerenciadorObjetos: NSManagedObjectContext!
    var anotacoes: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        gerenciadorObjetos = appDelegate.persistentContainer.viewContext
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        recuperarAnotacoes()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.anotacoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)
        let anotacao = self.anotacoes[indexPath.row]
        celula.textLabel?.text = anotacao.value(forKey: "texto") as? String
        
        let data = anotacao.value(forKey: "data")
        let formatacaoData = DateFormatter()
        formatacaoData.locale = Locale(identifier: "pt_BR")
        formatacaoData.timeZone = TimeZone(identifier: "GMT-03:00")
        formatacaoData.dateFormat = "dd/MM/yyyy HH:mm:ss"
        let novaData = formatacaoData.string(from: data as! Date)
        celula.detailTextLabel?.text = novaData
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let anotacao = self.anotacoes[indexPath.row]
            self.gerenciadorObjetos.delete(anotacao)
            self.anotacoes.remove(at: indexPath.row)
            do {
                try gerenciadorObjetos.save()
                self.tableView.deleteRows(at: [indexPath], with: .fade)
            } catch let erro as NSError {
                print("Erro ao salvar ", erro.description)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let anotacao = anotacoes[indexPath.row]
        self.performSegue(withIdentifier: "verAnotacao", sender: anotacao)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verAnotacao" {
            let viewControllerDestino = segue.destination as! AnotacaoViewController
            viewControllerDestino.anotacao = sender as? NSManagedObject
        }
    }
    
    func recuperarAnotacoes() {
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Anotacao")
        let ordenacao = NSSortDescriptor(key: "data", ascending: false)
        
        requisicao.sortDescriptors = [ordenacao]
        
        do {
            let anotacoesRecuperadas = try gerenciadorObjetos.fetch(requisicao)
            self.anotacoes = anotacoesRecuperadas as! [NSManagedObject]
            self.tableView.reloadData()
        } catch let erro as NSError {
            print("Erro ao listar anotacoes", erro.description)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
