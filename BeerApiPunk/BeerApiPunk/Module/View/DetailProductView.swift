//
//  DetailProductView.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 26/02/18.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import UIKit

class DetailProductView: UIView {

    @IBOutlet weak fileprivate var lblName: UILabel!
    @IBOutlet weak fileprivate var lblTagLine: UILabel!
    @IBOutlet weak fileprivate var lblAbv: UILabel!
    @IBOutlet weak fileprivate var lblIbu: UILabel!
    @IBOutlet weak fileprivate var lblDescription: UITextView!
    @IBOutlet weak var imgImage: UIImageView!
    
    func lblNameSetText(txt : String){
        self.lblName.text = txt
    }
    func lblTagLineSetText(txt : String){
        self.lblTagLine.text = txt
    }
    func lblAbvText(txt : String){
        self.lblAbv.text = txt
    }
    func lblIbuSetText(txt : String){
        self.lblIbu.text = txt
    }
    func lblDescriptionSetText(txt : String){
        self.lblDescription.text = txt
    }
}
