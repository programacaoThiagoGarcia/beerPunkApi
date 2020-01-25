//
//  ProductsViewController.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 26/02/18.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    var pageNo:Int=1
    var viewModel : ProductsViewModel?
    var getImage : UtilImage?
    
    var mainView : ProductsView{
        get {
            return self.view as! ProductsView
        }
    }
    
    var beerList : Beer = [] {
        didSet{
                DispatchQueue.main.async {
                    self.mainView.prepareTableView()
                    self.mainView.stopLoading()
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getImage = UtilImage()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.viewModel = ProductsViewModel()
        viewModel?.getProductsFromPage("1") { (beer , erro) in
            if let _beer = beer{
                self.beerList.append(contentsOf: _beer)
            }
        }
    }

}

//-MARK: Métodos de tableView Delegate e DataSource

extension ProductsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.beerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProductTableViewCell
        cell.lblProductName.text = beerList[indexPath.row].name
        cell.lblAvdProduct.text  = "\(beerList[indexPath.row].abv!) %vol"
        self.getImage?.downloadImage(placeHolder: UIImage(named: "beer"),from: beerList[indexPath.row].imageURL!, cell.imgProduct)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let vc : DetailProductViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
        vc.id                     = "\(self.beerList[indexPath.row].id)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        if indexPath.row == self.beerList.count - 1{
            self.pageNo += 1
            self.viewModel?.getProductsFromPage("\(self.pageNo)", { (beer, erro) in
                if let _beer = beer{
                    self.beerList.append(contentsOf: _beer)
                }
            })
        }
    }
}



