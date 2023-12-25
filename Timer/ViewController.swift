//
//  ViewController.swift
//  Timer
//
//  Created by Alvar Yussupov on 18/12/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.time = Int(textfield.text!) ?? 0
            }
        }
    }
    
}
