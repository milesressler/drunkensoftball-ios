//
//  UIViewControllerExtension.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/22/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    func keyboardWillShow(_ notification: Notification) {
        moveViewForKeyboard(notification, up: true)
    }
    
    func keyboardWillHide(_ notification: Notification) {
        moveViewForKeyboard(notification, up: false)
    }
    
    func moveViewForKeyboard(_ notification: Notification, up: Bool) {
        let keyboardRect = ((notification as NSNotification).userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        let endRect = self.view.convert(keyboardRect!, from: nil)
        let duration = (notification as NSNotification).userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        let tabBarAdjustment = self.tabBarController?.tabBar.isHidden ?? true ? 0 : self.tabBarController?.tabBar.frame.size.height ?? 0
        let adjustmentHeight = endRect.size.height - tabBarAdjustment
        self.kbAdjustingView.bottomConstraint!.constant = up ? -adjustmentHeight : 0
        UIView.animate(withDuration: duration, delay: 0, animations: { self.view.layoutIfNeeded() })
    }
    
    struct AssociatedKeys {
        static var kbAdjustingView = "KeyboardAdjustingViewKey"
        static var kTag = "tagKey"
    }
    
    var kbAdjustingView: UIView {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.kbAdjustingView) as! UIView
        }
        set (newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.kbAdjustingView, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}
