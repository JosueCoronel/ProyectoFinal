//
//  CustomPagarTableViewCell.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 12/12/22.
//

import UIKit

protocol CustomPagarTableViewCellDelegate {
    func customPagarTableView(_ tableViewCell: CustomPagarTableViewCell, didValidate isValid: Bool, icon: UIImageView)
}

class CustomPagarTableViewCell: UITableViewCell {

    @IBOutlet weak var direccionLabel: UILabel!
    @IBOutlet weak var imagenDireccionImageView: UIImageView!
    @IBOutlet weak var codigoCuponTextField: UITextField!
    @IBOutlet weak var iconValidadorImageView: UIImageView!
    
    var delegate: CustomPagarTableViewCellDelegate?
    
    func setup(descripcionCupones: DescripcionCupones){
        codigoCuponTextField.text = descripcionCupones.codigoCupon
    }
    
    @IBAction func didValidateButtonTap(_ sender: UIButton) {
        delegate?.customPagarTableView(self, didValidate: true, icon: iconValidadorImageView )
    }

}

