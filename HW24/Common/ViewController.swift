//
//  ViewController.swift
//  HW24
//
//  Created by Jarae on 29/3/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    //MARK: - Variables
    
    private let images: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!,
        UIImage(named: "7")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!,
        UIImage(named: "7")!
    ]
    
    //MARK: - UI Components
    private var  timeData: [Article] = []
    
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .systemBackground
        tableview.allowsSelection = true
        tableview.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tableview
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        setupUI()
        APIManager.shared.getData { [weak self] result in
            switch result {
            case .success(let data):
                print(data.articles.count)
                DispatchQueue.main.async {
                    guard let `self` = `self` else {return}
                    self.timeData = data.articles
                    self.tableView.reloadData()
            }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


    //MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .systemBlue
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.bottom.top.leading.trailing.equalToSuperview()
        }
    }
}
extension ViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(timeData.count)
        return timeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("error")
        }
        
        let value = timeData[indexPath.row]
        let image = images[indexPath.row]
        cell.configure(with: value, and: image)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            210
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SecondViewController()
        let value = timeData[indexPath.row]
        vc.configure(with: value, and: images[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
                    
    }
    
    
}

//leaving comment about user1 branch

//comment user1 in clone project

