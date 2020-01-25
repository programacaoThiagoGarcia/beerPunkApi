//
//  DetailProductViewModel.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 25/01/2020.
//  Copyright © 2020 Thiago Garcia. All rights reserved.
//

import Foundation
class DetailProductViewModel{
    func getProductsDetail(_ id :String, _ completion: @escaping (_ item :Beer?,_ erro  :String?)->()){
           let repository = ProjectRepository()
           repository.getBeersDetail(id) { (data, error) in
               if error != nil{
                    completion(nil,"ERRO")
               }
               do{
                   let beer = try? JSONDecoder().decode(Beer.self, from: data!)
                   if let _beer = beer{
                       completion(_beer,nil)
                   }
               }
           }
           
       }
}
