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


public extension UIView{
    func setRandomGradient(type:PokemonType, color1:UIColor, color2:UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.locations = [0.0, 0.5]
        gradientLayer.frame = self.bounds
        gradientLayer.opacity = 0.94
        layer.addSublayer(gradientLayer)
        
    }
}

extension UIColor {
  struct TypeColor {
      static var Normal1 : UIColor{ return #colorLiteral(red: 0.9142203283, green: 0.9142203283, blue: 0.9142203283, alpha: 1)}
      static var Normal2 : UIColor{ return  #colorLiteral(red: 0.984670928, green: 0.9660634612, blue: 0.9364027453, alpha: 1)}
      static var Fire1 : UIColor{ return #colorLiteral(red: 0.8352941176, green: 0.1725490196, blue: 0.01568627451, alpha: 1)}
      static var Fire2 : UIColor{ return #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)}
      static var Water1 : UIColor{ return #colorLiteral(red: 0.1019607843, green: 0.4666666667, blue: 0.8352941176, alpha: 1)}
      static var Water2 : UIColor{ return #colorLiteral(red: 0.1701592288, green: 0.579407785, blue: 0.8352941176, alpha: 1)}
      static var Grass1 : UIColor{ return #colorLiteral(red: 0.4509803922, green: 0.7607843137, blue: 0.2117647059, alpha: 1)}
      static var Grass2 : UIColor{ return #colorLiteral(red: 0.3772085863, green: 0.7607843137, blue: 0.3871298074, alpha: 1)}
      static var Electric1 : UIColor{ return #colorLiteral(red: 0.9019607843, green: 0.5725490196, blue: 0.007843137255, alpha: 1)}
      static var Electric2 : UIColor{ return #colorLiteral(red: 0.9019607843, green: 0.6849533563, blue: 0.007843137255, alpha: 1)}
      static var Ice1 : UIColor{ return #colorLiteral(red: 0.4274509804, green: 0.8274509804, blue: 0.9607843137, alpha: 1)}
      static var Ice2 : UIColor{ return #colorLiteral(red: 0.6814147534, green: 0.8274509804, blue: 0.9607843137, alpha: 1)}
      static var Fighting1 : UIColor{ return #colorLiteral(red: 0.5019607843, green: 0.2039215686, blue: 0.1176470588, alpha: 1)}
      static var Fighting2 : UIColor{ return #colorLiteral(red: 0.3511284722, green: 0.1453360353, blue: 0.08561420683, alpha: 1)}
      static var Poison1 : UIColor{ return #colorLiteral(red: 0.568627451, green: 0.2666666667, blue: 0.5764705882, alpha: 1)}
      static var Poison2 : UIColor{ return #colorLiteral(red: 0.4407419218, green: 0.154076318, blue: 0.3567442602, alpha: 1)}
      static var Ground1 : UIColor{ return #colorLiteral(red: 0.8196078431, green: 0.6901960784, blue: 0.3333333333, alpha: 1)}
      static var Ground2 : UIColor{ return #colorLiteral(red: 0.8196078431, green: 0.7518460587, blue: 0.5779835994, alpha: 1)}
      static var Flying1 : UIColor{ return #colorLiteral(red: 0.5607843137, green: 0.631372549, blue: 0.9450980392, alpha: 1)}
      static var Flying2 : UIColor{ return #colorLiteral(red: 0.6704864166, green: 0.7138295568, blue: 0.9450980392, alpha: 1)}
      static var Psychic1 : UIColor{ return #colorLiteral(red: 0.9176470588, green: 0.2705882353, blue: 0.4941176471, alpha: 1)}
      static var Psychic2 : UIColor{ return #colorLiteral(red: 0.9176470588, green: 0.6116664298, blue: 0.7338980538, alpha: 1)}
      static var Bug1 : UIColor{ return #colorLiteral(red: 0.5411764706, green: 0.5921568627, blue: 0.05882352941, alpha: 1)}
      static var Bug2 : UIColor{ return #colorLiteral(red: 0.7320866327, green: 0.7597458965, blue: 0.6288757065, alpha: 1)}
      static var Rock1 : UIColor{ return #colorLiteral(red: 0.6941176471, green: 0.6, blue: 0.3098039216, alpha: 1)}
      static var Rock2 : UIColor{ return #colorLiteral(red: 0.8220683396, green: 0.811965207, blue: 0.6097969879, alpha: 1)}
      static var Ghost1 : UIColor{ return #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.4, alpha: 1)}
      static var Ghost2 : UIColor{ return #colorLiteral(red: 0.5116533176, green: 0.4828248217, blue: 0.6446101641, alpha: 1)}
      static var Dark1 : UIColor{ return #colorLiteral(red: 0.3254901961, green: 0.2392156863, blue: 0.1843137255, alpha: 1)}
      static var Dark2 : UIColor{ return #colorLiteral(red: 0.1501538826, green: 0.1107259934, blue: 0.08617268371, alpha: 1)}
      static var Dragon1 : UIColor{ return #colorLiteral(red: 0.4156862745, green: 0.3294117647, blue: 0.8, alpha: 1)}
      static var Dragon2 : UIColor{ return #colorLiteral(red: 0.5934328498, green: 0.5253001666, blue: 0.9721235795, alpha: 1)}
      static var Steel1 : UIColor{ return #colorLiteral(red: 0.6901960784, green: 0.6901960784, blue: 0.7450980392, alpha: 1)}
      static var Steel2 : UIColor{ return #colorLiteral(red: 0.4265857439, green: 0.4264301275, blue: 0.4630287247, alpha: 1)}
      static var Fairy1 : UIColor{ return #colorLiteral(red: 0.9529411765, green: 0.6862745098, blue: 0.9529411765, alpha: 1)}
      static var Fairy2 : UIColor{ return #colorLiteral(red: 0.9219488273, green: 0.8177718364, blue: 0.9529411765, alpha: 1)}
      static var none1 : UIColor{ return #colorLiteral(red: 0.1274266098, green: 0.1267005094, blue: 0.1205396407, alpha: 1)}
      static var none2 : UIColor{ return #colorLiteral(red: 0.2160274621, green: 0.2147964975, blue: 0.2043519222, alpha: 1)}

      static var Title90 : UIColor{ return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.9)}
      static var Border20 : UIColor{ return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2030732616)}
      static var BackgroundNumber : UIColor{ return #colorLiteral(red: 0.5902383207, green: 0.5902383207, blue: 0.5902383207, alpha: 0.3616773593)}
      static var TextNumber : UIColor{ return #colorLiteral(red: 0.150943024, green: 0.150943024, blue: 0.150943024, alpha: 0.6764021109)}
      
  }
}


public extension UIViewController{
    func setupDetailNavBar(){
        let attrs = [NSAttributedString.Key.font: ThemeManager.RegularFont(26),
                     NSAttributedString.Key.foregroundColor: UIColor.TypeColor.Title90]
        navigationController?.navigationBar.standardAppearance.titleTextAttributes = attrs
        navigationController?.navigationBar.tintColor = .white
        UINavigationBar.animate(withDuration: 0.1) {
            self.navigationController?.navigationBar.layoutIfNeeded()
        }
    }
    
    
    func setupHomeNavBar()  {
        let attrs = [NSAttributedString.Key.font: ThemeManager.CustomFont(29)]
        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = attrs
        self.navigationItem.backBarButtonItem?.tintColor = .white
        view.backgroundColor = .white
        title = "Pokedex"
        UINavigationBar.animate(withDuration: 0, delay: 0, options: .transitionCurlDown) {
            self.navigationController?.navigationBar.layoutIfNeeded()
        } completion: { _ in }
    }
}
