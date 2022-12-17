//
//  CustomComprarTableViewCell.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 6/12/22.
//

import UIKit

protocol CustomComprarTableViewCellDelegate:AnyObject {
    func eliminarProducto(cell: CustomComprarTableViewCell, index: Int)
    
    func agregarProducto(cell:CustomComprarTableViewCell, index: Int)
}

class CustomComprarTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var pagarLabel: UILabel!
    @IBOutlet weak var cantidadLabel: UILabel!
    @IBOutlet weak var fotoImageView: UIImageView!
    
    weak var delegate: CustomComprarTableViewCellDelegate?
    
    var indexCell: Int = 0
    
    @IBAction func agregarButton(_ sender: UIButton) {
        
        delegate?.agregarProducto(cell: self, index: indexCell)
    }
    @IBAction func cancelarButton(_ sender: UIButton) {
        delegate?.eliminarProducto(cell: self, index: indexCell)
    }

}
