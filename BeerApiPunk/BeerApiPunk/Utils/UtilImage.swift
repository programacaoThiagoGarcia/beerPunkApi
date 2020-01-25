//
//  UtilImage.swift
//  BeerApiPunk
//
//  Created by Thiago Garcia on 25/01/2020.
//  Copyright © 2020 Thiago Garcia. All rights reserved.
//

import Foundation
import UIKit

class UtilImage{
    private var cacheList : [String : Data] = [:]
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(placeHolder : UIImage?, from url: String, _ imageView: UIImageView) {
        let _url = URL(string: url)
        imageView.image = placeHolder
        if self.cacheList[url] != nil{
            print("Used Cache")
            imageView.image = UIImage(data: self.cacheList[url]!)
        }else{
            DispatchQueue.global().async {
                print("Download Started")
                self.getData(from: _url!) { data, response, error in
                    guard let data = data, error == nil else { return }
                    print("Download Finished")
                    DispatchQueue.main.async() {
                        self.cacheList[url] = data
                        imageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    func downloadImage(from url: String, _ imageView: UIImageView, _ completion : @escaping(_ complete : Bool)-> ()) {
        let _url = URL(string: url)
        imageView.image = nil
        if self.cacheList[url] != nil{
            print("Used Cache")
            imageView.image = UIImage(data: self.cacheList[url]!)
            completion(true)
        }else{
            print("Download Started")
            DispatchQueue.global().async {
                self.getData(from: _url!) { data, response, error in
                    guard let data = data, error == nil else { return }
                    print("Download Finished")
                    DispatchQueue.main.async() {
                        self.cacheList[url] = data
                        imageView.image = UIImage(data: data)
                        completion(true)
                    }
                }
            }
            
        }
    }
}
