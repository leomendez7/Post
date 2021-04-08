//
//  MainDataSource.swift
//  Post
//
//  Created by Leonardo Mendez on 4/7/21.
//

import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return tableData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell",
                                                                              for: indexPath) as? MainTableViewCell else { return MainTableViewCell() }
        cell.configureCell(post: tableData[indexPath.row])
        return cell
    }
    
}
