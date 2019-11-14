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

    var carDetailsProvider: CarDetailsProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let delegate = carDetailsProvider else { return 0 }
        
        return delegate.carList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "carDetailsCell", for: indexPath) as? CarDetailsTableViewCell, let delegate = carDetailsProvider else { return UITableViewCell() }

        let carObject = delegate.carList[indexPath.row]
        
        let carViewModel = CarViewModel(car: carObject)
        cell.configure(with: carViewModel)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewLayoutConstants.cellHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = carDetailsProvider else { return }
        
        let carObject = delegate.carList[indexPath.row]
        carDetailsProvider?.showCarDetails(carObject: carObject)
    }
}
