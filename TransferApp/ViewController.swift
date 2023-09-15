//
//  ViewController.swift
//  TransferApp
//
//  Created by 1234 on 15.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var dataLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Передача данных через свойство
    /*
     Создается излишняя связанность между вью контроллерами, так как в одном вью контроллере происходит
     работа с другим вью контроллером. Необходимо использовать протокол.
     */
    
    @IBAction func editDataWithProperty(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Создание экземпляра контроллера редактирования через сториборд
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! UpdatingDataController
        editScreen.updatingData = dataLabel.text ?? ""
        
        // Переход к контроллеру редактирования
        self.navigationController?.pushViewController(editScreen as! UIViewController, animated: true)
    }
    
    func updateLabel(withText text: String) {
        dataLabel.text = text
    }
    
    // MARK: Передача данных через segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toEditScreen":
            prepareEditScreen(segue)
        default:
            break
        }
    }
    
    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? SecondViewController else {
            return
        }
        destinationController.updatingData = dataLabel.text ?? ""
    }
    
    @IBAction func unwindToFirstScreen(_ segue: UIStoryboardSegue){
        
    }
    
    // MARK: Передача данных с помощью делегата
    
    @IBAction func editDataWithDelegate(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        editScreen.updatingData = dataLabel.text ?? ""
        
        editScreen.handleUpdatedDataDelegate = self
        
        self.navigationController?.pushViewController(editScreen, animated: true)
    }
    
}

extension ViewController: DataUpdateProtocol {
    func onDataUpdate(data: String) {
        updateLabel(withText: data)
    }
    
}
