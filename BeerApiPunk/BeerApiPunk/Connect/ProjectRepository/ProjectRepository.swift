//
//  ProjectRepository.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 22/01/20.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import Foundation

class  ProjectRepository{
    let networkManager : NetworkManager = NetworkManager()
    
    //-MARK: Connect method

    func getBeers(_ page : String, _ completion: @escaping (_ res : Data?,_ erro : String?) -> ()) {
        networkManager.getBeers(page) { (data, erro) in
            if erro != nil{
                print(erro!)
                completion(nil,erro!)
            }else{
                if let _data = data {
                    completion(_data,nil)
                    return
                }
                print("ERRO PARSE JSON")
                completion(nil,Warning.parse.rawValue)
            }
        }
    }
    
        
    func getBeersDetail(_ item : String,  completion : @escaping(_ res : Data?, _ erro : String?)->()) {
        networkManager.getBeersDetail(item) { (data, erro) in
            if erro != nil {
                print(erro!)
                completion(nil,erro!)
            }else{
                if let _data = data {
                    completion(_data,nil)
                    return
                }
                print("ERRO PARSE JSON")
                completion(nil,Warning.parse.rawValue)
            }
        }
    }
    
}





