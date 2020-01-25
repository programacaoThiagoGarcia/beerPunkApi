//
//  NetworkManager.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 22/01/20.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import Foundation

struct NetworkManager{
    let route = Router<GotoBusApi>()
    static  let environment : NetworkEnvironment = .production
    
    func getBeers(_ page : String,_ completion : @escaping(_ item : Data?, _ error : String?)->()){
        route.request(.getBeers(page: page)) { (data, response, erro) in
            if erro != nil{
                completion(nil, erro!.localizedDescription)
            }else{
                do{
                    if let _data = data{
                        completion(_data, nil)
                    }else{
                        completion(nil, "Connection Problem!")
                    }
                }
            }
        }
    }
    
    func getBeersDetail(_ item : String,  completion:@escaping(_ item  :Data?, _ error : String?)-> ()) {
        route.request(.getBeerInfo(item : item)) { (data, resposnse, error) in
            if error != nil{
                completion(nil,error!.localizedDescription)
            }else{
                do {
                    if let _data = data {
                        completion(_data, nil)
                    }else{
                        completion(nil, "Connection Problem!")
                    }
                }
            }
        }
    }
    
}
