//
//  CustomPagarTableViewCell.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 12/12/22.
//

import UIKit

<<<<<<< HEAD
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

=======
class CustomPagarTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
>>>>>>> cead4b37e28d2a3516d2fad0e39fb1895d19caaf
