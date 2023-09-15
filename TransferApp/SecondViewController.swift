//
//  SecondViewController.swift
//  TransferApp
//
//  Created by 1234 on 15.09.2023.
//

import UIKit

class SecondViewController: UIViewController, UpdatingDataController {
    
    var updatingData: String = ""
    var handleUpdatedDataDelegate: DataUpdateProtocol?
    
    @IBOutlet var dataTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Обновление значения label на ViewController с использованием NavigationController
    @IBAction func saveDataWithProperty(_ sender: UIButton) {
        self.navigationController?.viewControllers.forEach({ viewController in
            (viewController as? ViewController)?.updateLabel(withText: dataTextField.text ?? "")
    })
    }
    
    private func updateTextFieldData(withText text: String?) {

        self.dataTextField.text = text
    }
    
    // Обновление значения label на ViewController с использованием unwind segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toFirstScreen":
            prepareFirstScreen(segue)
        default:
            break
        }
    }
    
    private func prepareFirstScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? ViewController else {
            return
        }
        destinationController.updateLabel(withText: dataTextField.text ?? "")
    }
    
    // Обновление значения label на ViewController с использованием dalegate
    
    @IBAction func saveDataWithDelegate(_ sender: UIButton) {
        handleUpdatedDataDelegate?.onDataUpdate(data: dataTextField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
    
    

    deinit {
        print("SecondVC is deleted")
    }

}
