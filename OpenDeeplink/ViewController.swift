//
//  ViewController.swift
//  OpenDeeplink
//
//  Created by Phatcharaphan Ananpreechakun on 10/3/2564 BE.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func didTapOpenApp(_ sender: Any) {
    let mobileNumber = "0846936500"
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

