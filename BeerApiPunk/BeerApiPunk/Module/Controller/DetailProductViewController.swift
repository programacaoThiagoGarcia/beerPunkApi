//
//  DetailProductViewController.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 26/02/18.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import UIKit


class DetailProductViewController: UIViewController {
    var choiseProduct : BeerElement?
    var id : String = ""
    var viewModel : DetailProductViewModel?
    
    var mainView: DetailProductView{
        get{
            return self.view as! DetailProductView
        }
    }
    
    var item : BeerElement? = nil {
        didSet{
            DispatchQueue.global().async {
                DispatchQueue.main.async {
                    self.mainView.lblNameSetText(txt: (self.item?.name!)!)
                    self.mainView.lblTagLineSetText(txt:(self.item?.tagline!)!)
                    self.mainView.lblDescriptionSetText(txt:(self.item?.beerDescription)!)
                    self.mainView.lblIbuSetText(txt:(self.item?.ibu?.toString()) ?? "--")
                    self.mainView.lblAbvText(txt:"\((self.item?.abv)!) %vol")
                    UtilImage().downloadImage(placeHolder: UIImage(named: "beer"),from: (self.item?.imageURL)!, self.mainView.imgImage)
                }
            }
                
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
         navigationController?.navigationBar.prefersLargeTitles = false
        self.viewModel = DetailProductViewModel()
        prepareView()
        
    }
    
    func prepareView(){
        self.viewModel?.getProductsDetail(self.id, { (item, erro) in
            if erro == nil{
                let _item : BeerElement? = item?[0]
                if let beer = _item {
                    self.item = beer
                }
                
            }else{
                let alert : UIAlertController = UIAlertController(title: Warning.title.rawValue, message: Warning.itemNull.rawValue, preferredStyle: .alert)
                let action : UIAlertAction    = UIAlertAction(title: "Ok", style: .cancel) { (action) in
                    self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
}



