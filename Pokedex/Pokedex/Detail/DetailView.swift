//
//  DetailView.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 21/04/22.
//

import Foundation
import UIKit
import SnapKit

class DetailView: UIViewController {

    //MARK: VIPER Elements
    var presenter : ViewToPresenterProtocolDetail?

    //MARK: UIElements
    var viewBg: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var viewImagesContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var ivSpriteFrontDefault: CustomImageView = {
        let iv = CustomImageView()
        iv.clipsToBounds = true
        iv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = iv.frame.width / 2
        guard let ur = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/104.png") else {return iv}
        iv.donwloadImage(from: ur)
        return iv
    }()
    
    lazy var ivSpriteFrontShiny: CustomImageView = {
        let iv = CustomImageView()
        iv.clipsToBounds = true
        iv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = iv.frame.width / 2
        guard let ur = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/104.png") else {return iv}
        iv.donwloadImage(from: ur)
        return iv
    }()
    
    lazy var viewRounded: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 32
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.borderColor = UIColor.TypeColor.colorBorder20.cgColor
        view.layer.borderWidth = 1.2
        
        return view
    }()
    
    lazy var lblPokemonNumber: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .clear
        lbl.layer.cornerRadius = 14
        lbl.text = "#104"
        lbl.layer.backgroundColor = UIColor.TypeColor.colorBorder20.cgColor
        lbl.font = ThemeManager.RegularFont(22)
        return lbl
    }()
    
    //MARK: DataElements
    
    
    //MARK: LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        let attrs = [NSAttributedString.Key.font: ThemeManager.RegularFont(28),
                     NSAttributedString.Key.foregroundColor: UIColor.TypeColor.colorTitle90]
        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = attrs
        title = "Cubone"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    func setupView()  {
        view.backgroundColor = .white
        view.setRandomGradient(type: .Normal, color1: UIColor.TypeColor.colorGround1, color2: UIColor.TypeColor.colorGround2)
        
        view.addSubview(viewImagesContainer)
        viewImagesContainer.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview().offset(-16)
            make.height.equalTo(view.frame.height / 3)
            make.centerX.equalToSuperview()
        }
        
        
        viewImagesContainer.addSubview(ivSpriteFrontDefault)
        ivSpriteFrontDefault.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.width.equalTo(view.frame.width / 1.6)
            make.height.equalToSuperview()
        }
        viewImagesContainer.addSubview(ivSpriteFrontShiny)
        ivSpriteFrontShiny.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview()
            make.width.equalTo(view.frame.width / 3.4)
            make.height.equalToSuperview()
        }
        
        view.addSubview(viewRounded)
        viewRounded.snp.makeConstraints { make in
            make.top.equalTo(viewImagesContainer.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        
        
        let tapGestureRecognizerDefault = UITapGestureRecognizer(target: self, action: #selector(imageDefaultTapped(tapGestureRecognizer:)))
        ivSpriteFrontDefault.isUserInteractionEnabled = true
        ivSpriteFrontDefault.addGestureRecognizer(tapGestureRecognizerDefault)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageShinyTapped(tapGestureRecognizer:)))
        ivSpriteFrontShiny.isUserInteractionEnabled = true
        ivSpriteFrontShiny.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    func resizeImages(imgSmall:CustomImageView, imgStandar:CustomImageView) {
        
        imgSmall.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(view.frame.width / 1.6)
            make.height.equalToSuperview()
        }
        
        imgStandar.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(view.frame.width / 3.4)
            make.height.equalToSuperview()
        }
        
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    //MARK: Actions
    
    @objc func imageDefaultTapped(tapGestureRecognizer: UITapGestureRecognizer){
        resizeImages(imgSmall: ivSpriteFrontDefault, imgStandar: ivSpriteFrontShiny)
    }
    
    @objc func imageShinyTapped(tapGestureRecognizer: UITapGestureRecognizer){
        resizeImages(imgSmall: ivSpriteFrontShiny , imgStandar: ivSpriteFrontDefault)
    }
    
}


extension DetailView:PresenterToViewProtocolDetail{
    func showPokemonData(info: PokemonHomeModel) {
        
    }
    
    func showErrorFetchingData(status: Bool) {
        
    }
    
    
}
