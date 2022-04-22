//
//  Loader.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 22/04/22.
//

import Foundation
import UIKit
import Lottie
import SnapKit

public class Loader{
    
    var mainView:UIView
    var viewBlurEffect: UIVisualEffectView
    
    init(parentView:UIView, _ radius:CGFloat? = 0.0) {
        self.mainView = parentView
        let blurEffect = UIBlurEffect(style: .light)
        viewBlurEffect = UIVisualEffectView(effect: blurEffect)
        viewBlurEffect.alpha = 0.0
        viewBlurEffect.frame = CGRect.zero
        viewBlurEffect.clipsToBounds = true
        if radius != 0.0{
            viewBlurEffect.layer.cornerRadius = radius!
        }
    }
    
    
    
    func showLoader() {
        lazy var animationView: AnimationView = {
            let animationView = AnimationView()
            animationView.animation = Animation.named("loader")
            animationView.frame = CGRect.zero
            animationView.clipsToBounds = true
            animationView.backgroundColor = .clear
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .autoReverse
            return animationView
        }()
        
        
        
        mainView.addSubview(viewBlurEffect)
        viewBlurEffect.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        viewBlurEffect.contentView.addSubview(animationView)
        animationView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
        animationView.play()
        
        UIView.animate(withDuration: 0.4) {
            self.viewBlurEffect.alpha = 1.0
        }
    }
    
    func hideLoader()  {
        viewBlurEffect.removeFromSuperview()
    }
    
    
    
    
}
