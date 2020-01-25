//
//  EndPointType.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 22/01/20.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL    : URL        { get }
    var path       : String     { get }
    var httpMethod : HTTPMethod { get }
    var task       : HTTPTask   { get }
}
