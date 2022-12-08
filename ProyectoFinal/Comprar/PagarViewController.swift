//
//  PagarViewController.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 8/12/22.
//

import UIKit

class PagarViewController: UIViewController {

    @IBOutlet weak var totalPagarLabel: UILabel!
    var listaFinal:[DescripcionCompra] = []
    var totalPagar:Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        print(listaFinal)
        totalPagarLabel.text = String(totalPagar)
    }
    
}
