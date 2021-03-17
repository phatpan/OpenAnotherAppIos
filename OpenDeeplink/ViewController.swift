//
//  ViewController.swift
//  OpenDeeplink
//
//  Created by Phatcharaphan Ananpreechakun on 10/3/2564 BE.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var mobileNumberTextfield: UITextField!
  @IBOutlet weak var defaultMobileNumberLabel: UILabel!
  var realMobileNumber = "0912345626"
  var mockMobileNumber = "0980000001"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mobileNumberTextfield.smartInsertDeleteType = UITextSmartInsertDeleteType.no
    mobileNumberTextfield.delegate = self
    defaultMobileNumberLabel.text = "Real api: default mobile = \(realMobileNumber)"
    //defaultMobileNumberLabel.text = "Mock api: default mobile\(mockMobileNumber)"
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
    deeplinkOpenApp()
  }
  
  func getAppRealUrl() -> URL {
    let clientId = "4102000587456317"
    let scope = "profile"
    let uri = "https://{rp_server}/2002"
    let state = "12356700000000456178215ANM785190"
    let responseType = "code"
    if let number = mobileNumberTextfield.text, number != "" {
      realMobileNumber = number
    }
    let scheme = "myais"
    let host = "MyIds"
    let path = ""
    var urlComponents = URLComponents()
    urlComponents.scheme = scheme
    urlComponents.host = host
    urlComponents.path = path
    urlComponents.queryItems = [
      URLQueryItem(name: "mobileNumber", value: realMobileNumber),
      URLQueryItem(name: "clientId", value: clientId),
      URLQueryItem(name: "scope", value: scope),
      URLQueryItem(name: "redirectUri", value: uri),
      URLQueryItem(name: "state", value: state),
      URLQueryItem(name: "responseType", value: responseType)
    ]

    return urlComponents.url!
  }
  
  func getAppMockUrl() -> URL {
    let clientId = "4102000587456315"
    let scope = "profile"
    let uri = "https://redirect_uri"
    let state = "12356700000000456178215ANM785185"
    let responseType = "code"
    if let number = mobileNumberTextfield.text, number != "" {
      mockMobileNumber = number
    }
    let scheme = "myais"
    let host = "MyIds"
    let path = ""
    var urlComponents = URLComponents()
    urlComponents.scheme = scheme
    urlComponents.host = host
    urlComponents.path = path
    urlComponents.queryItems = [
      URLQueryItem(name: "mobileNumber", value: realMobileNumber),
      URLQueryItem(name: "clientId", value: clientId),
      URLQueryItem(name: "scope", value: scope),
      URLQueryItem(name: "redirectUri", value: uri),
      URLQueryItem(name: "state", value: state),
      URLQueryItem(name: "responseType", value: responseType)
    ]

    return urlComponents.url!
  }
  
  func deeplinkOpenApp() {
    //let url = getAppMockUrl()
    let url = getAppRealUrl()
    UIApplication.shared.open(url)
  }
  
}

