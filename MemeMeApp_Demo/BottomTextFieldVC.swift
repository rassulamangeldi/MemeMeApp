//
//  BottomTextFieldVC.swift
//  MemeMeApp_Demo
//
//  Created by Ras on 04.12.2021.
//

import Foundation
import UIKit

class BottomTextFieldVC: UIViewController, UIImagePickerControllerDelegate,
                        UINavigationControllerDelegate, UITextFieldDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {

    super.viewWillAppear(animated)
    subscribeToKeyboardNotifications()
}

override func viewWillDisappear(_ animated: Bool) {

    super.viewWillDisappear(animated)
    unsubscribeFromKeyboardNotifications()
}

func subscribeToKeyboardNotifications() {

    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    
}

func unsubscribeFromKeyboardNotifications() {

    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
}

@objc func keyboardWillShow(_ notification:Notification) {

    view.frame.origin.y -= getKeyboardHeight(notification)
}

@objc func keyboardWillHide(_ notification:Notification) {

    view.frame.origin.y += getKeyboardHeight(notification)
}

func getKeyboardHeight(_ notification:Notification) -> CGFloat {

    let userInfo = notification.userInfo
    let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
    return keyboardSize.cgRectValue.height
}
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
