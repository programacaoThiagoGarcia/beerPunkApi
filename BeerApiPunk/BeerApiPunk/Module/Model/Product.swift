//
//  Product.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 26/02/18.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import Foundation



class Product{
    var name        : String = ""
    var img         : String = ""
    var abv         : Double = 0.0
    var tagline     : String = ""
    var ibu         : Double = 0.0
    var description : String = ""
    var page         : String = ""
    
    
    
    func getProductions(_ completion: @escaping([Product])-> ()){
        let url = BASEURL.getUrlPage(self.page)
        ConnectionApi.getProduct(url) { (success, fail) in
            if !fail{
                completion(success)
            }else{
                let prods :[Product] = []
                completion(prods)
            }
        }
    }
    
  
    
    
}


