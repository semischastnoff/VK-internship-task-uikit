//
//  ViewController.swift
//  VK
//
//  Created by Данила Семисчастнов on 28.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView: UITableView = UITableView(frame: .zero)
    
    var refresher: UIRefreshControl!
    
    var data: [Cell] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.configureNavigationBar()
        self.configureRefresher()
        
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
        self.tableView.allowsSelection = false
        self.updateLayout(with: self.view.frame.size)
        self.view.addSubview(self.tableView)
        
        self.tableView.addSubview(self.refresher)
        self.refresh()
    }
    
    private func configureRefresher() {
        self.refresher = UIRefreshControl()
        self.refresher.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        
    }
    
    @objc func refresh() {
        DispatchQueue.main.async {
            self.fetchData()
            self.tableView.reloadData()
            self.refresher.endRefreshing()
        }
    }
    
    func fetchData() {
        let url = URL(string: "https://95c8606c-95e9-4307-9610-4b5b618782da.mock.pstmn.io/getCells")!
        
        let request = URLRequest(url: url, timeoutInterval: 10)
        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let fetchedData = data {

                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode([Cell].self, from: fetchedData)
                    DispatchQueue.main.async {
                        self.data = decodedData
                        self.tableView.reloadData()
                    }
                } catch {
                    print("failure")
                }
            }
        }
        .resume()
    }

    private func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect(origin: .zero, size: size)
        self.tableView.rowHeight = 80
    }
    
    private func configureNavigationBar() {
        self.navigationItem.title = "Показания датчика"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.date.text = self.data[indexPath.row].date
        cell.value.text = self.data[indexPath.row].value
        return cell
    }
    
    
}
