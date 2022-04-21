//
//  CustomImageView.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 20/04/22.
//

import Foundation
import UIKit
import Lottie

let imgCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    var task:URLSessionDataTask!
    lazy var viewAnimation: AnimationView = {
        let view = AnimationView(animation: Animation.named("loader"))
        view.contentMode = .scaleAspectFit
        view.play()
        view.loopMode = .autoReverse
        return view
    }()
    
    func donwloadImage(from url:URL) {
        image = nil
        
        addSpinner()
        
        if let task = task {
            task.cancel()
        }
        
        
        if let imgFromCache = imgCache.object(forKey: url.absoluteString as AnyObject) as? UIImage{
            image = imgFromCache
            removeSpinner()
            return
        }
        
        task = URLSession.shared.dataTask(with: url){(data, response, error) in
            guard let data = data,
                  let imgDownloaded = UIImage(data: data) else {
                      return
                  }
            
            imgCache.setObject(imgDownloaded, forKey: url.absoluteString as  AnyObject)
            
            DispatchQueue.main.async {
                self.image = imgDownloaded
                self.removeSpinner()
            }
        }
        
        task.resume()
    }
    
    func addSpinner()  {
        addSubview(viewAnimation)
        viewAnimation.frame.origin.x = 10
        viewAnimation.frame.origin.y = 16
        viewAnimation.frame.size.width = 40
        viewAnimation.frame.size.height = 40
        viewAnimation.play()
    }
    
    func removeSpinner()  {
        viewAnimation.removeFromSuperview()
    }
}
