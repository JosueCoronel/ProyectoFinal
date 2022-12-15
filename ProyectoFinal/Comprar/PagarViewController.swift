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
    //@IBOutlet weak var codigoCuponTextField: UITextField!

    var listaFinal:[DescripcionCompra] = []
    var listaCupones:[DescripcionCupones] = []
    
    var totalPagar:Double = 0.00
    var tipoPago: Int = 1
    var codigoCupon: UITextField?

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
    
    @IBAction func metodoPagoSegmentedControl(_ sender: UISegmentedControl) {
    }
    
}

extension PagarViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customPagar", for: indexPath) as? CustomPagarTableViewCell{
            cell.direccionLabel.text = ""
            //cell.imagenDireccionImageView = UIImageView(image: <#T##UIImage?#>)
            cell.codigoCuponTextField.text = ""
            
//            cell.indexCell = indexPath.row
            cell.delegate = self
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
}

extension PagarViewController {
    func mostrarAlerta(title: String, message: String, icon: UIImageView) {
        let alertaGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let guiaOk = UIAlertAction(title: "Ok", style: .default) //{ (action) in icon.tintColor = .red}
        
        /*let cancelar = UIAlertAction(title: "Cancelar", style: .default, handler: {(action) in self.totalPagarLabel.text  = "" })
        */
        
        alertaGuia.addAction(guiaOk)
        //alertaGuia.addAction(cancelar)
        present(alertaGuia, animated: true, completion: nil)

    }
}

extension PagarViewController: CustomPagarTableViewCellDelegate {
    func customPagarTableView(_ tableViewCell: CustomPagarTableViewCell, didValidate isValid: Bool, icon: UIImageView) {
        var val:Int = 0
        let tab = tableViewCell
        let codigo = tab.codigoCuponTextField.text
        if(codigo == ""){
            mostrarAlerta(title: "Código Vacio!", message: "Ingrese un código de cupón", icon: tab.iconValidadorImageView)
            return
        }
        
        let tabbar = ContenedorTabBarController()
        listaCupones = tabbar.listaCupones
        listaCupones.forEach { e in
            if(e.codigoCupon == codigo) {
                val = 1
                icon.tintColor = .green
                icon.image = UIImage(systemName: "checkmark.circle.fill")
                tab.codigoCuponTextField.isUserInteractionEnabled = false
            }
        }
        if(val == 0){
            mostrarAlerta(title: "Código Incorrecto!", message: "Ingrese un código de cupón valido", icon: tab.iconValidadorImageView)
            return
        }
    }
}

