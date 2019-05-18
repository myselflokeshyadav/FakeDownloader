//
//  UIViewController+Extension.swift
//  FakeDownloader
//
//  Created by Lokesh Yadav on 5/17/19.
//  Copyright © 2019 Lokesh Yadav. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showGenericAlert(with message: String) {
        let alert = UIAlertController(title: Constant.alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constant.alertButtonTitle, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
