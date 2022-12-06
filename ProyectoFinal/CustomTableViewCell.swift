//
//  CustomTableViewCell.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 6/12/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var subTituloLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
