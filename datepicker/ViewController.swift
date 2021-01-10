//
//  ViewController.swift
//  datepicker
//
//  Created by helpmac on 15/12/20.
//  Copyright © 2020 TechnoTouch Infotech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dateTextField: UITextField!
    
    
        var selectedTime = Date()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.dateTextField.addInputViewDateTimePicker(target: self, selector: #selector(doneButtonPressed))
    }

    
    @objc func doneButtonPressed() {
       if let  datePicker = self.dateTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "dd-MM-yyyy HH:mm a"
          // dateFormatter.dateStyle = .medium
          self.selectedTime = datePicker.date
           self.dateTextField.text = dateFormatter.string(from: datePicker.date)
          // self.selectedDate = dateFormatter.date(from: self.birthDateTextfield.text!)!
        
       }
       self.dateTextField.resignFirstResponder()
    }
    

}
   extension UITextField {

   func addInputViewDatePicker(target: Any, selector: Selector) {

    let screenWidth = UIScreen.main.bounds.width

    //Add DatePicker as inputView
    let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
    datePicker.datePickerMode = .date
    datePicker.maximumDate = Date()
   // datePicker.backgroundColor = .white
    self.inputView = datePicker

    //Add Tool Bar as input AccessoryView
    let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
    let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
    toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)

    self.inputAccessoryView = toolBar
 }
    func addInputViewDateTimePicker(target: Any, selector: Selector) {

       let screenWidth = UIScreen.main.bounds.width

       //Add DatePicker as inputView
       let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
       datePicker.datePickerMode = .dateAndTime
    
        
       datePicker.minimumDate = Date()
      // datePicker.backgroundColor = .white
       self.inputView = datePicker

       //Add Tool Bar as input AccessoryView
       let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
       let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
       let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
       let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
       toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)

       self.inputAccessoryView = toolBar
    }
  
 
   @objc func cancelPressed() {
     self.resignFirstResponder()
   }
}

