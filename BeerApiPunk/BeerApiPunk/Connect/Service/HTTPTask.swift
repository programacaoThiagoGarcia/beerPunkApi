//
//  HTTPTask.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 22/01/20.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import Foundation

enum HTTPTask{
    case resquestQuery
    case resquest
    case requestParameters(parameters : ObjectOutput)
}
