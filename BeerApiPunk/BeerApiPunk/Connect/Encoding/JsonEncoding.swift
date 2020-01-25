//
//  JsonEncoding.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 22/01/20.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import Foundation

public typealias Parameters = [String : Any]

public protocol ParameterEncoder{
    func encode( parameters : Parameters) throws
}


