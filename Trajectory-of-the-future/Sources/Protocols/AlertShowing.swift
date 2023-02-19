//
//  AlertShowing.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import UIKit

protocol AlertShowing {
    func showAlert(title: String?, message: String?)
}

extension AlertShowing where Self: UIViewController {
    func showAlert(title: String?, message: String?) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Resources.String.alertShowingActionOkText, style: .default)
        controller.addAction(okAction)
        
        present(controller, animated: true)
    }
}
