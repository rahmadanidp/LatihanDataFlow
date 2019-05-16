//
//  ViewController.swift
//  LatihanDataFlow
//
//  Created by Rahmadani Pratiwi on 16/05/19.
//  Copyright © 2019 Rahmadani Pratiwi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    @IBAction func registerPressed(_ sender: Any) {
        if fullNameTextField.text == "" || phoneTextField.text == "" {
            let alert = UIAlertController(title: "Error", message: "All text field must be filled.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (alertAction) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "toConfirmPage", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ConfirmViewController{
            destination.fullname = fullNameTextField.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameTextField.delegate = self
        phoneTextField.delegate = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == fullNameTextField{
            phoneTextField.becomeFirstResponder()
        } else if textField == phoneTextField{
            textField.resignFirstResponder()
        }
        
        return true
    }
}
