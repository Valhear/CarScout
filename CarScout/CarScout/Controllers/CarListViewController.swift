//
//  CarListViewController.swift
//  CarScout
//
//  Created by Valentina Henao on 11/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import UIKit

class CarListViewController: UITableViewController {
    private enum TableViewLayoutConstants {
        static let headerHeight: CGFloat = 60.0
        static let cellHeight: CGFloat = 150.0
    }

    var carDetailsPresenter: CarDetailsPresenter?
    var carListDataSource: CarListDataSourceProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return carListDataSource?.numberOfSections() ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carListDataSource?.numberOfCarItems() ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let carDetailsCell = tableView.dequeueReusableCell(withIdentifier: "carDetailsCell", for: indexPath) as? CarDetailsTableViewCell
        guard let cell = carDetailsCell, let datasource = carListDataSource, let carVM = datasource.item(at: indexPath) else {
            return UITableViewCell()
        }
        cell.configure(with: carVM)
        
        return cell
    }
}

// MARK: - Table view delegate

extension CarListViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewLayoutConstants.cellHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let carVM = carListDataSource?.item(at: indexPath)
        carDetailsPresenter?.showCarDetails(carItem: carVM)
    }
}
