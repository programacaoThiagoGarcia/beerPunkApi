//
//  Extension.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 26/02/18.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import Foundation


extension String{
    func getUrlPage(_ page : String) -> String{
        return self.replacingOccurrences(of: "{p}", with: page)
    }
    
}
extension Int{
    func toString() ->String{
        return"\(self)"
    }
}
extension Double{
    func toString() ->String{
        return"\(self)"
    }
}
