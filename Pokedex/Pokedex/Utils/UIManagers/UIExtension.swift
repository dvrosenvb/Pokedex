//
//  UIExtension.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 19/04/22.
//

import Foundation
import UIKit


//MARK: UITextfield  Extension

public extension UITextField{
    
    func setupGenericTextField() {
        font = ThemeManager.RegularFont(18)
        keyboardType = .alphabet
        borderStyle = .none
        returnKeyType = .search
        layer.cornerRadius = ThemeManager.roundedDefault
        layer.backgroundColor = ThemeManager.backgroundSearchBox.cgColor
    }
    
    func setLeftView(){
        lazy var viewL:UIView = {
            let view = UIView()
            return view
        }()
       
        leftViewMode = .always
        leftView = viewL
        leftView?.frame = CGRect(x: 0, y: 14, width: 20, height: 20)
        
    }
    
}
