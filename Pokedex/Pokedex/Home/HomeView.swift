//
//  HomeView.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 19/04/22.
//

import Foundation
import UIKit
import SnapKit

class HomeView:UIViewController{
    //MARK: VIPER Elements
    var presenter : ViewToPresenterProtocolHome?
    
    //MARK: Value Elements
    var tableView: UITableView?
    var reusableTableView : ComponentDataSource!
    
    //MARK: UIElements
    lazy var tfSearch: UITextField = {
        let tf = UITextField()
        tf.setupGenericTextField()
        tf.setLeftView()
        tf.placeholder = "Buscar..."
        return tf
    }()
    
    lazy var btnSearch: UIButton = {
        let btn = UIButton()
        var config = UIButton.Configuration.plain()
        config.buttonSize = .large
        config.imagePlacement = .all
        btn.configuration = config
        btn.tintColor = ThemeManager.searchIcon80
        btn.setImage(UIImage(systemName: ThemeManager.iconSearch), for: .normal)
        return btn
    }()
    
    lazy var btnCancel: UIButton = {
        let btn = UIButton()
        var config = UIButton.Configuration.plain()
        config.buttonSize = .large
        config.imagePlacement = .all
        btn.configuration = config
        btn.alpha = 0
        btn.isEnabled = false
        btn.tintColor = ThemeManager.searchIcon80
        btn.setTitle("Cancelar", for: .normal)
        return btn
    }()
    
    lazy var viewTableContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    //MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let attrs = [NSAttributedString.Key.font: ThemeManager.CustomFont(29)]
        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = attrs
        view.backgroundColor = .white
        title = "Pokedex"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Funcs
    func setupView() {
        view.addSubview(tfSearch)
        tfSetConstraints(tfSearch)
        
        view.addSubview(viewTableContainer)
        viewTableContainer.backgroundColor = .white
        viewTableContainer.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(tfSearch.snp.bottom).offset(16)
            make.height.equalTo(view.frame.height * 0.9)
        }
        
        btnCancel.alpha = 1
        view.addSubview(btnCancel)
        btnCancel.snp.makeConstraints { make in
            make.top.equalTo(tfSearch)
            make.leading.equalTo(tfSearch.snp.trailing).offset(10)
            make.height.equalTo(tfSearch.snp.height)
        }
        
        tfSearch.addTarget(self, action: #selector(enterToTF), for: .editingDidBegin)
        tfSearch.addTarget(self, action: #selector(searchPokemon), for: .primaryActionTriggered)
        
    }
    
    func installTable(model:[CollectionTableViewCellModel])  {
        DispatchQueue.main.async {
            self.tableView = UITableView()
            self.tableView?.frame = self.viewTableContainer.bounds
            self.tableView?.backgroundColor = .white
            guard let vt = self.tableView else { return }
            self.reusableTableView = ComponentDataSource(vt, self.viewTableContainer.frame.size.width, self.viewTableContainer.frame.size.height, model)
            self.reusableTableView.delegate = self
            self.viewTableContainer.addSubview(self.reusableTableView.tableView)
        }
    }
    
    
    func goToSearch()  {
        guard let txt = tfSearch.text else { return }
        btnCancelRestore(btnCancel)
        tfSetConstraints(tfSearch)
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
        
        if !txt.isEmpty {
            let item = ItemCollectionViewCellModel(id: 0, pokemonName: "bulbasaur", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/1.png")
            
            let item1 = ItemCollectionViewCellModel(id: 1, pokemonName: "ivysaur", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/2.png")
            
            let item2 = ItemCollectionViewCellModel(id: 2, pokemonName: "venusaur", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/3.png")
            
            let item3 = ItemCollectionViewCellModel(id: 3, pokemonName: "charmander", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/4.png")
            
            let item4 = ItemCollectionViewCellModel(id: 4, pokemonName: "charmeleon", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/5.png")
            
            let item5 = ItemCollectionViewCellModel(id: 4, pokemonName: "charizard", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/6.png")
            
            let item6 = ItemCollectionViewCellModel(id: 4, pokemonName: "squirtle", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/7.png")
            
            let item7 = ItemCollectionViewCellModel(id: 4, pokemonName: "wartortle", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/8.png")
            
            let item8 = ItemCollectionViewCellModel(id: 4, pokemonName: "blastoise", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/9.png")
            
            let item9 = ItemCollectionViewCellModel(id: 4, pokemonName: "caterpie", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/10.png")
            
            let item10 = ItemCollectionViewCellModel(id: 4, pokemonName: "metapod", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/11.png")
            
            let item11 = ItemCollectionViewCellModel(id: 4, pokemonName: "butterfree", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/12.png")
            
            let item12 = ItemCollectionViewCellModel(id: 4, pokemonName: "weedle", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/13.png")
            
            let item13 = ItemCollectionViewCellModel(id: 4, pokemonName: "kakuna", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/14.png")
            
            let item14 = ItemCollectionViewCellModel(id: 4, pokemonName: "beedrill", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/15.png")
            
            let item15 = ItemCollectionViewCellModel(id: 4, pokemonName: "pidgey", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/16.png")
            
            let item16 = ItemCollectionViewCellModel(id: 4, pokemonName: "pidgeotto", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/17.png")
            
            let item17 = ItemCollectionViewCellModel(id: 4, pokemonName: "pidgeot", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/18.png")
            
            let item18 = ItemCollectionViewCellModel(id: 4, pokemonName: "rattata", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/19.png")
            
            let item19 = ItemCollectionViewCellModel(id: 4, pokemonName: "raticate", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/20.png")
            
            let model = CollectionTableViewCellModel(data: [item, item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15, item16, item17, item18, item19])
            installTable(model: [model])
        }else{
            print("nada que buscar")
        }
        
    }
    
    func tfSetConstraints(_ tfSearch:UITextField)  {
        tfSearch.snp.removeConstraints()
        tfSearch.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width * 0.9)
            make.height.equalTo(ThemeManager.heightStandardTextField)
        }
    }
    
    func btnSetConstraints(_ btn:UIButton)  {
        btn.snp.removeConstraints()
        btn.alpha = 1
        btn.isEnabled = true
        
        btn.snp.makeConstraints { make in
            make.top.equalTo(tfSearch)
            make.leading.equalTo(tfSearch.snp.trailing).offset(-10)
            make.height.equalTo(tfSearch.snp.height)
        }
    }
    
    func btnCancelRestore(_ btnCancel:UIButton)  {
        btnCancel.alpha = 0
        btnCancel.isEnabled = false
    }
    
    
    //MARK: Actions
    @objc func endEdition(){
        view.endEditing(true)
    }
    
    @objc func searchPokemon(){
        view.endEditing(true)
        goToSearch()
    }
    
    @objc func cancelSearch(){
        view.endEditing(true)
        btnCancelRestore(btnCancel)
        tfSetConstraints(self.tfSearch)
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func enterToTF(){
        btnSetConstraints(btnCancel)
        
        tfSearch.snp.remakeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(view.frame.width * 0.72)
            make.height.equalTo(ThemeManager.heightStandardTextField)
        }
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
        
        btnCancel.addTarget(self, action: #selector(cancelSearch), for: .touchUpInside)
    }
}

extension HomeView:PresenterToViewProtocolHome{
    
    func HomeSucceded(info: String) {
        
    }
    
    func HomeFailed(info: String) {
        
    }
}


extension HomeView:ComponentDataSourceProtocol{
    func elementTapped(model: ItemCollectionViewCellModel) {
    }
}
