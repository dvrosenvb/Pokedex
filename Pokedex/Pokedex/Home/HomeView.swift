//
//  HomeView.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 19/04/22.
//

import Foundation
import UIKit
import SnapKit
import Lottie

class HomeView:UIViewController{
    //MARK: VIPER Elements
    var presenter : ViewToPresenterProtocolHome?
    
    //MARK: Value Elements
    var tableView: UITableView?
    var reusableTableView : ComponentDataSource!
    var homeInformation:[PokemonHomeModel] = []
    
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
    
    lazy var viewAnimation: AnimationView = {
        let view = AnimationView(animation: Animation.named("monster"))
        view.contentMode = .scaleAspectFit
        view.play()
        view.loopMode = .autoReverse
        return view
    }()
    
    lazy var lbl = UILabel()
    
    
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
        presenter?.interactor?.fetchFirst20()
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
        for vi in viewTableContainer.subviews{
            vi.removeFromSuperview()
        }
        
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
            presenter?.searchByNameOrId(reference: txt)
        }else{
            presenter?.interactor?.fetchFirst20()
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
    
    func clearView() {
        tableView?.removeFromSuperview()
    }
    
    func clearViewAfterSearch(){
        for iview in viewTableContainer.subviews{
            iview.removeFromSuperview()
        }
    }
    
    
    func addAnimation() {
        view.addSubview(viewAnimation)
        viewAnimation.play()
        viewAnimation.loopMode = .autoReverse
        viewAnimation.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalTo(tfSearch.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        
        lbl.text = "¡Ops! no se encontró ese Pokemon"
        lbl.textAlignment = .center
        lbl.font = ThemeManager.RegularFont(40)
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 4
        lbl.textColor = ThemeManager.searchIcon80
        view.addSubview(lbl)
        lbl.snp.makeConstraints { make in
            make.top.equalTo(tfSearch.snp.bottom).offset(50)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func removeAnimation(){
        lbl.removeFromSuperview()
        viewAnimation.removeFromSuperview()
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
        removeAnimation()
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
    func HomeSucceded(info: [CollectionTableViewCellModel]) {
        clearView()
        clearViewAfterSearch()
        installTable(model: info)
    }
    
  
    
    func HomeFailed(status: Bool) {
        if status{
            let model = CollectionTableViewCellModel(data: [])
            addAnimation()
            clearView()
            clearViewAfterSearch()
            installTable(model: [model])
        }
    }
    
}


extension HomeView:ComponentDataSourceProtocol{
    func elementTapped(model: PokemonHomeModel) {
        view.endEditing(true)
        tfSetConstraints(tfSearch)
        btnCancelRestore(btnCancel)
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}

extension HomeView:NetManagerProtocol{
    func getDataFromServer(dataFetchedFromServer: PokemonHomeModelCodable) {
        
    }
}
