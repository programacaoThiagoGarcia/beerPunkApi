//
//  DetailProductViewController.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 26/02/18.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import UIKit


class DetailProductViewController: UIViewController {
    
    lazy var viewModel : DetailProductViewModel = {
        return DetailProductViewModel()
    }()
    var choiseProduct : BeerElement?
    var id : String = ""
    
    var mainView: DetailProductView{
        get{
            return self.view as! DetailProductView
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationController?.navigationBar.prefersLargeTitles = false
        initViewModel()
        
    }
    func initViewModel(){
        viewModel.getProductsDetail(self.id)
//        {
//            if erro == nil{
//                let _item : BeerElement? = item?[0]
//                if let beer = _item {
//                    self.item = beer
//                }
//
//            }else{
//            }
//        })
        
        viewModel.showAlerClosure = {[weak self] () in
            DispatchQueue.main.async {
                let alert : UIAlertController = UIAlertController(title: Warning.title.rawValue, message: Warning.itemNull.rawValue, preferredStyle: .alert)
                let action : UIAlertAction    = UIAlertAction(title: "Ok", style: .cancel) { (action) in
                    self?.navigationController?.popViewController(animated: true)
                    }
                alert.addAction(action)
                self?.present(alert, animated: true, completion: nil)
            }
        }
        viewModel.processView = {[weak self] () in
            DispatchQueue.main.async {
                self?.mainView.lblNameSetText(txt:self!.viewModel.name!)
                self?.mainView.lblTagLineSetText(txt:self!.viewModel.tagline!)
                self?.mainView.lblDescriptionSetText(txt:self!.viewModel.beerDescription!)
                self?.mainView.lblIbuSetText(txt:self!.viewModel.ibu!)
                self?.mainView.lblAbvText(txt:self!.viewModel.abv!)
                UtilImage.downloadImageNoCache(placeHolder: UIImage(named: "beer"), from: self!.viewModel.imageURL!, (self?.mainView.imgImage)!)
            }
        }
        
    }
}



