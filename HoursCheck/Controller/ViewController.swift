//
//  ViewController.swift
//  HoursCheck
//
//  Created by Lily  on 09.02.2019.
//  Copyright © 2019 Lily . All rights reserved.
//

import UIKit
import Firebase
import UserNotifications


class ViewController: UIViewController, UITextFieldDelegate {
    
    var ref:DatabaseReference!
    
    @IBOutlet weak var nameTextfield: UITextField!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ref = Database.database().reference()
        nameTextfield.delegate = self
     
    }
    
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    
    
    
    //MARK: - Actions
    @IBAction func startButtonTapped(_ sender: Any) {
        
        if nameTextfield.text?.isEmpty ?? true {
            
            let alert = UIAlertController(title: "Error", message: "Type name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            return;
            
        }
        
        let date = Date()
        
        let currDateFormated = DateFormatter()
        currDateFormated.dateFormat = "HH:mm:ss"
        let currDate = currDateFormated.string(from: date)

        //push
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy"
        let formattedDate = format.string(from: date)
        
        
        ref?.child("Leaders").child(nameTextfield.text!).child(String(formattedDate)).child("Start  time").setValue(currDate)
        
        
        let alert = UIAlertController(title: "Saved", message: "Thanks for coming!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
        
        
    }
    
    
    
    
    @IBAction func endButtonTapped(_ sender: Any) {
        
        if nameTextfield.text?.isEmpty ?? true {
            
            let alert = UIAlertController(title: "Error", message: "Type name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            return;
            
        }
        
        let date = Date()
        
        let currDateFormated = DateFormatter()
        currDateFormated.dateFormat = "HH:mm:ss"
        let currDate = currDateFormated.string(from: date)
        
        
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy"
        let formattedDate = format.string(from: date)
        
        
        ref?.child("Leaders").child(nameTextfield.text!).child(String(formattedDate)).child("End  time").setValue(currDate)
        
        
        let alert = UIAlertController(title: "Saved", message: "Thanks for coming!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
       
        
        
    }
}

