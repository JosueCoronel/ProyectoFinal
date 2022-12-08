//
//  CompraViewController.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 6/12/22.
//

import UIKit

class CompraViewController: UIViewController,UITableViewDataSource{

    var Lista = [
        DescripcionCompra(
            codigo: "",
            titulo: "Pastel de Chocolate",
            precio: 40.10,
            imagen: "pastel-chocolate",
            cantidad: 1
        ),
        DescripcionCompra(
            codigo: "",
            titulo: "Pastel de Fresa",
            precio: 40.25,
            imagen: "pastel-fresa",
            cantidad: 2
        )
    ]
    var listaPorComprar:[DescripcionCompra] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pagarTotalLabel: UILabel!
    
    
    @IBAction func comprarButton(_ sender: UIButton) {
        let listaCompra = Lista
        guard let pagarViewController = storyboard?.instantiateViewController(withIdentifier: "PagarViewController") as? PagarViewController else {
            return
        }
        pagarViewController.listaFinal.append(contentsOf: listaCompra)
        let valor = calcularTotal()
        pagarViewController.totalPagar = valor
        
        present(pagarViewController, animated: true)
    }
    @IBAction func borrarTodoButton(_ sender: UIButton) {
        Lista.removeAll()
        pagarTotalLabel.text = "S/. \(String(0))"
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        print(listaPorComprar)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaPorComprar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let valor = calcularTotal()
        pagarTotalLabel.text =  "S/. \(String(valor))"
        //let indice = indexPath.row
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCompra", for: indexPath) as? CustomComprarTableViewCell{
            let lista = listaPorComprar[indexPath.row]
            //cell.setup(lista: lista)
            cell.tituloLabel.text = lista.titulo
            cell.pagarLabel.text = "S/. \(String(lista.precio))"
            cell.cantidadLabel.text = String(lista.cantidad)
            cell.fotoImageView.image = UIImage(named: lista.imagen)
            cell.indexCell = indexPath.row
            cell.delegate = self
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
}

extension CompraViewController: CustomComprarTableViewCellDelegate{
    func agregarProducto(cell: CustomComprarTableViewCell,index: Int) {
        var cantidadResult = Lista[index].cantidad
        cantidadResult = cantidadResult + 1
        Lista[index].cantidad = cantidadResult
        let valor = calcularTotal()
        pagarTotalLabel.text =  "S/. \(String(valor))"
        tableView.reloadData()
    }
    
    func eliminarProducto(cell: CustomComprarTableViewCell, index: Int) {
        var cantidadResult = Lista[index].cantidad
        cantidadResult = cantidadResult - 1
        Lista[index].cantidad = cantidadResult
        if(cantidadResult == 0){
            Lista.remove(at: index)
        }
        let valor = calcularTotal()
        pagarTotalLabel.text =  "S/. \(String(valor))"
        tableView.reloadData()
    }
    func calcularTotal() -> Double{
        var totalPagar:Double = 0.00
        Lista.forEach { e in
            let Monto = Double(e.cantidad) * e.precio
            totalPagar = totalPagar + Monto
        }
        //let valor = totalPagar.redondear(numeroDeDecimales: 3)
        return totalPagar
    }
}

extension Double {
    func redondear(numeroDeDecimales: Int) -> String {
        let formateador = NumberFormatter()
        formateador.maximumFractionDigits = numeroDeDecimales
        formateador.roundingMode = .down
        return formateador.string(from: NSNumber(value: self)) ?? ""
    }
}

