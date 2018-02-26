//
//  ProductsViewController.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 26/02/18.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import UIKit
import SDWebImage

class ProductsViewController: UIViewController {
    var production  : Product?
    var productions : [Product] = []
    var isDataLoading:Bool=false
    var pageNo:Int=1
    var limit:Int=20
    var offset:Int=0
    var didEndReached:Bool=false
    
    var mainView : ProductsView{
        get {
            return self.view as! ProductsView
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.tableView.delegate   = self
        self.mainView.tableView.dataSource = self
        navigationController?.navigationBar.prefersLargeTitles = true
        production = Product()
        production?.page = pageNo.toString()
        
        production?.getProductions({ (produtionsResult) in
            self.productions.append(contentsOf: produtionsResult)
            self.mainView.tableView.reloadData()
            self.mainView.indicatorLoader.stopAnimating()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender != nil {
            let viewController = segue.destination as! DetailProductViewController
            viewController.choiseProduct = sender as? Product
        }
    }

}

//-MARK: Métodos de tableView Delegate e DataSource

extension ProductsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProductTableViewCell
        cell.lblProductName.text = productions[indexPath.row].name
        cell.lblAvdProduct.text  = "\(productions[indexPath.row].abv) %vol"
        cell.imgProduct.sd_setImage(with: URL(string: productions[indexPath.row].img), placeholderImage: UIImage(named: "beer"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "productsToDetail", sender: productions[indexPath.row])
    }
    
    
}


//-MARK: Métodos para o Scroll
extension ProductsViewController : UIScrollViewDelegate{
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isDataLoading = false
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        self.mainView.tableView.reloadData()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if ((mainView.tableView.contentOffset.y + mainView.tableView.frame.size.height) >= mainView.tableView.contentSize.height)
        {
            if !isDataLoading{
                isDataLoading = true
                self.pageNo=self.pageNo + 1
                self.limit=self.limit + 10
                self.offset=self.limit * self.pageNo
                production?.page = self.pageNo.toString()
                production?.getProductions({ (produtionsResult) in
                    self.productions.append(contentsOf: produtionsResult)
                    
                })
                
            }
        }
        
    }
    
    
}
