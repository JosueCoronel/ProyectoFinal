//
//  PagarViewController.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 8/12/22.
//

import UIKit

class PagarViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPagarLabel: UILabel!
    
    var listaFinal:[DescripcionCompra] = []
    var totalPagar:Double = 0.00
    var tipoPago: Int = 1
    
    @IBAction func validarCuponButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func hacerPedidoButton(_ sender: UIButton) {
        guard let detalleViewController = storyboard?.instantiateViewController(withIdentifier: "ReciboPagadoViewController") as? ReciboPagadoViewController else {return}
        detalleViewController.modalPresentationStyle = .fullScreen
        present(detalleViewController, animated: true)
    }
    
    @IBAction func verProductosButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        print(totalPagar)
        let compraViewController = CompraViewController()
        print(compraViewController)
        totalPagarLabel.text = "S/. \(String(totalPagar))"
    }
    
}

extension PagarViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "customPagar", for: indexPath)
    }
}

