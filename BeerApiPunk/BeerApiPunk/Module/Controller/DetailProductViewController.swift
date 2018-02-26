//
//  DetailProductViewController.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 26/02/18.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import UIKit


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
 
            DispatchQueue.global().async {
                let url = URL(string: (self.choiseProduct?.img)!)
                let http = URLSession.shared
                let task = http.dataTask(with: url!, completionHandler: { (data, response, erro) in
                    DispatchQueue.main.async {
                        self.mainView.imgImage.image = UIImage(data: data!)
                        self.mainView.indicator.stopAnimating()
                    }
                })
                task.resume()
            }
            
        }
    }


}
