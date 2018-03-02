//
//  DetailProductViewController.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 26/02/18.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import UIKit
import SDWebImage


class DetailProductViewController: UIViewController {
    var choiseProduct : Product?
    
    var mainView: DetailProductView{
        get{
            return self.view as! DetailProductView
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
         navigationController?.navigationBar.prefersLargeTitles = false
        prepareView()
        
    }
    
    func prepareView(){
        if choiseProduct != nil{
            self.mainView.lblName.text        = choiseProduct?.name
            self.mainView.lblTagLine.text     = choiseProduct?.tagline
            self.mainView.lblDescription.text = choiseProduct?.description
            self.mainView.lblIbu.text         = choiseProduct?.ibu.toString()
            self.mainView.lblAbv.text         = "\((choiseProduct?.abv)!) %vol"
            self.mainView.imgImage.sd_setImage(with: URL(string: (choiseProduct?.img)!), placeholderImage: UIImage(named: "berr"))
            
            }
            
        }
    }



