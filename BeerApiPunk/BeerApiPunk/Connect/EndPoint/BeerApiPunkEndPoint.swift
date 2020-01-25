//
//  BeerApiPunkEndPoint.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 25/01/2020.
//  Copyright © 2020 Thiago Garcia. All rights reserved.
//

import Foundation

enum GotoBusApi{ // serviços consultados
    case getBeers(page : String)
    case getBeerInfo(item : String)
}

enum NetworkEnvironment { // base url
    case production
    case desenv
}

extension GotoBusApi : EndPointType{
    var task: HTTPTask {
        switch self {
        case .getBeers:
            return .resquestQuery
        case . getBeerInfo:
            return .resquest
        }
    }

    var path: String {
        switch self {
        case .getBeers(let page):
            return page
        case .getBeerInfo(let item):
            return "/\(item)"
        }
    }
    
    
    var httpMethod: HTTPMethod { // Methodos
        switch self {
        case .getBeers:
            return .get
        case .getBeerInfo:
            return .get
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else{fatalError("Invalid")}
        return url
    }
    
     var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .production: return "https://api.punkapi.com/v2/beers"
        case .desenv:     return "http://192.168.1.233:8080"
        
        }
    }
    
}

//https://api.punkapi.com/v2/beers?page={p}&per_page=25"



