//
//  ViewController.swift
//  TransferApp
//
//  Created by 1234 on 15.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var dataLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Передача данных через свойство
    /*
     Создается излишняя связанность между вью контроллерами, так как в одном вью контроллере происходит
     работа с другим вью контроллером.
     */
    @IBAction func editDataWithProperty(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Создание экземпляра контроллера редактирования через сториборд
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! UpdatingDataController
        editScreen.updatingData = dataLabel.text ?? ""
        
        // Переход к контроллеру редактирования
        self.navigationController?.pushViewController(editScreen as! UIViewController, animated: true)
    }
}

