//
//  ViewController.swift
//  Meus filmes
//
//  Created by Felipe on 23/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var filmes:[Filme] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var filme:Filme
        filme = Filme(titulo: "Filme 01", descricao: "descricao01", imagem: #imageLiteral(resourceName: "filme1"))
        filmes.append(filme)
        
        filme = Filme(titulo: "Filme 02", descricao: "descricao02", imagem: #imageLiteral(resourceName: "filme2"))
        filmes.append(filme)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filme = filmes[indexPath.row]
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! FilmeCelula
        celula.filmeImageView.image = filme.imagem
        celula.titulo.text = filme.titulo
        celula.descricao.text = filme.descricao
        
        
        /*celula.filmeImageView.layer.cornerRadius = 42
        celula.filmeImageView.clipsToBounds = true */
        
        /*celula.textLabel?.text = filme.titulo
        celula.imageView?.image = filme.imagem*/
        
        return celula
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detalheFilme" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let filme = self.filmes[indexPath.row]
                let viewControllerDestino = segue.destination as! DetalhesFilmeViewController
                viewControllerDestino.filme = filme
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

