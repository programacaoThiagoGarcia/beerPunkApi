//
//  ProductsView.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 26/02/18.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import UIKit

class ProductsView: UIView {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorLoader: UIActivityIndicatorView!
    
    func prepareView(){
        self.tableView.tableFooterView = UIView()
    }
    
    func stopLoading(){
        self.indicatorLoader.stopAnimating()
    }
    func startLoading(){
        self.indicatorLoader.startAnimating()
    }
    func prepareTableView() {
        self.tableView.reloadData()
    }

}
