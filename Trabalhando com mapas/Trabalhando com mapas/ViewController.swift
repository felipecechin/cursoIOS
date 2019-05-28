//
//  ViewController.swift
//  Trabalhando com mapas
//
//  Created by Felipe on 28/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let latitude:CLLocationDegrees = -23.586
        let longitude:CLLocationDegrees = -46.657
        
        let deltaLatitude:CLLocationDegrees = 0.08
        let deltaLongitude:CLLocationDegrees = 0.08
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let areaVisualizacao:MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaVisualizacao)
        mapa.setRegion(regiao, animated: true)
        
        
        let anotacao = MKPointAnnotation()
        anotacao.coordinate = localizacao
        anotacao.title = "São Paulo aqui"
        anotacao.subtitle = "São Paulo fica aqui"
        
        mapa.addAnnotation(anotacao)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

