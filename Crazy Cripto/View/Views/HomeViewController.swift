//
//  ViewController.swift
//  Crazy Cripto
//
//  Created by Ahmet Burak Öztürk on 22.06.2024.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    //MARK: - Variables
    var cyrptoList = [CyrptoModel]()
    var cyrptoVM = CyrptoViewModel()
    var disposeBag = DisposeBag()
    
    
    
    //MARK: - UI Components
    var homeTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return table
    }()
    
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    
    override func viewDidLayoutSubviews() {
        self.homeTableView.frame = self.view.bounds
    }
    
    
    
    //MARK: - Setup UI
    private func setupUi(){
        self.view.addSubview(homeTableView)
        
        configureNavbar()
            
        setBindings()
        getData()
    }
    
    
    //MARK: - Private Functions
    private func configureNavbar(){
        self.navigationController?.navigationBar.backgroundColor = UIColor.systemBackground
        self.navigationItem.title = "Crazy Cyrpto"
    }
    
    
    private func getData(){
        cyrptoVM.getDataResponse()
        
    }
    
    
    private func setBindings(){
        cyrptoVM.cyrptoList
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { cyrptos in
                self.cyrptoList = cyrptos
                self.homeTableView.reloadData()
            }.disposed(by: disposeBag)
    }


}

//MARK: - Extensions

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cyrptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        else {
            fatalError("HomeTableViewCell couldn't dequeue for HomeTableView in ViewController!")
        }
        let cyrpto = cyrptoList[indexPath.row]
        cell.configrue(nameText: cyrpto.currency, priceText: cyrpto.price)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
