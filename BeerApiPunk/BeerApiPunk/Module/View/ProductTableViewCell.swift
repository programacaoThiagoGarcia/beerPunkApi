//
//  ProductTableViewCell.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 26/02/18.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var lblAvdProduct: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    
    var beerListCellViewModel : BeerListCellViewModel? {
        didSet {
            lblProductName.text = beerListCellViewModel?.lblProductName
            lblAvdProduct.text = beerListCellViewModel?.lblAvdProduct
            UtilImage.downloadImageNoCache(placeHolder: UIImage(named: "beer"), from: beerListCellViewModel!.imageUrl, imgProduct)
        }
    }

}
