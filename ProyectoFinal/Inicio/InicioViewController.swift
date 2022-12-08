//
//  InicioViewController.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 6/12/22.
//

import UIKit

class InicioViewController: UIViewController{
    
    var Lista = [
        Descripcion(
            codigo: "P0001",
            titulo: "Pastel de Chocolate",
            subTitulo: "Chocale con Mani",
            descripcion: "Muy Rico1",
            precio: 40.1,
            imagen: "pastel-chocolate"
        ),
        Descripcion(
            codigo: "P0002",
            titulo: "Pastel de Fresa",
            subTitulo: "Fresa con Vainilla",
            descripcion: "Muy Rico2",
            precio: 40.2,
            imagen: "pastel-fresa"
        ),
        Descripcion(
            codigo: "P0003",
            titulo: "Pastel de Lucuma",
            subTitulo: "Lucma con Pasas",
            descripcion: "Muy Rico3",
            precio: 40.3,
            imagen: "pastel-lucuma"
        ),
        Descripcion(
            codigo: "P0004",
            titulo: "Pastel de Frutos Rojos",
            subTitulo: "Con Pecanas",
            descripcion: "Muy Rico4",
            precio: 40.4,
            imagen: "pastel-lucuma"
        )
    ]
    
    var listaFavorito:[Descripcion] = []
    var listaCarrito:[DescripcionCompra] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        let lista = listaCarrito
        
        guard let compraViewController = storyboard?.instantiateViewController(withIdentifier: "CompraViewController") as? CompraViewController else {
            return
        }
        compraViewController.listaPorComprar.append(contentsOf: lista)
        //present(compraViewController, animated: false)
    }
    
}

extension InicioViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as? CustomInicioTableViewCell{
            let lista = Lista[indexPath.row]
            //cell.setup(lista: lista)
            cell.tituloLabel.text = lista.titulo
            cell.subtituloLabel.text = lista.subTitulo
            cell.precioLabel.text = String(lista.precio)
            cell.fotoImageView?.image = UIImage(named: lista.imagen)
            
            cell.indexCell = indexPath.row
            cell.delegate = self
            return cell
        }else{
            return UITableViewCell()
        }

    }
}

extension InicioViewController: CustomInicioTableViewCellDelegate{
    func agregarFavorito(cell: CustomInicioTableViewCell,index: Int) {
        tableView.reloadData()
    }
    
    func agregarCarrito(cell: CustomInicioTableViewCell, index: Int) {
        let lista = Lista[index]
        if(listaCarrito.count > 0){
            var i = 0
            var val = 0
            listaCarrito.forEach { e in
                if(e.codigo == lista.codigo){
                    let cantidad = e.cantidad
                    listaCarrito[i].cantidad = cantidad + 1
                    val = 1
                }
                i=i+1
            }
        
            if val == 0 {
                let listaTemp = [DescripcionCompra(codigo: lista.codigo,titulo: lista.titulo, precio: Double(lista.precio), imagen: lista.imagen, cantidad: 1
                                                  )
                ]
                listaCarrito += listaTemp
            }
        }else {
            let listaTemp = [DescripcionCompra(codigo: lista.codigo,titulo: lista.titulo, precio: Double(lista.precio), imagen: lista.imagen, cantidad: 1
            )
            ]
            listaCarrito += listaTemp
        }
        tableView.reloadData()
    }
}
