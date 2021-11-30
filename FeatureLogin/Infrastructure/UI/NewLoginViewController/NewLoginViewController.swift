//
//  NewLoginViewController.swift
//  FeatureLogin
//
//  Created by Dmitrii Voronin on 28.11.2021.
//

import UIKit

public class NewLoginViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet private var loginInputField: UITextField!
    @IBOutlet private var passwordInputField: UITextField!
    @IBOutlet private var loginButton: UIButton!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
           
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
          // if keyboard size is not available for some reason, dont do anything
          return
        }

        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height , right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
      }

      @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
            
        
        // reset back the content inset to zero after keyboard is gone
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
      }
    
    @IBAction func loginAction(_ sender: Any) {
    }
    
}


extension NewLoginViewController: InstantiateFromStoryboard {
    public static let storyboardName = "NewLoginViewController"
}
