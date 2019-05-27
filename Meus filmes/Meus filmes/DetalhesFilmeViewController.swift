//
//  DetalhesFilmeViewController.swift
//  Meus filmes
//
//  Created by Felipe on 27/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import Foundation
import UIKit

class DetalhesFilmeViewController: UIViewController {
    
    var filme:Filme!
    
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var filmeImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tituloLabel.text = self.filme.titulo
        self.filmeImage.image = self.filme.imagem
        self.descricaoLabel.text = self.filme.descricao
    }
    
    
}

