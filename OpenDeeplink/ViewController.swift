//
//  ViewController.swift
//  OpenDeeplink
//
//  Created by Phatcharaphan Ananpreechakun on 10/3/2564 BE.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var mobileNumberTextfield: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mobileNumberTextfield.smartInsertDeleteType = UITextSmartInsertDeleteType.no
    mobileNumberTextfield.delegate = self
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let textFieldText = textField.text,
          let rangeOfTextToReplace = Range(range, in: textFieldText) else {
      return false
    }
    let substringToReplace = textFieldText[rangeOfTextToReplace]
    let count = textFieldText.count - substringToReplace.count + string.count
    return count <= 10
  }
  
  @IBAction func didTapOpenApp(_ sender: Any) {
    var mobileNumber = "0980000002"
    if let number = mobileNumberTextfield.text {
      mobileNumber = number
    }
    let clientId = "4102000587456315"
    let scope = "profile"
    let redirectUri = "https://redirect_uri"
    let state = "12356700000000456178215ANM785185"
    let responseType = "code"
    
    let url = URL(string: "myais://MyIds?mobileNumber=\(mobileNumber)&clientId=\(clientId)&scope=\(scope)&redirectUri=\(redirectUri)&state=\(state)&responseType=\(responseType)")
    
    UIApplication.shared.open(url!) { (result) in
      if result {
        
      }
    }
  }
  
}

