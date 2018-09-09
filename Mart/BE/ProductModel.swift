//
//  ProductModel.swift
//  Mart
//
//  Created by Genie Mae Lorena Edera on 9/8/18.
//  Copyright © 2018 Genie Mae Lorena Edera. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Products {
    var productKey: Int
    var productImageUrl: String
    var productName: String
    var productPrice: String
    
    private static var _cache:Array<Products>?
    
    static func clear()->Void {
        _cache = nil
    }
    
    static func getProducts(callback:@escaping (Array<Products>?)->Void) {
        
        APIHandler.getProductListFromApi { response in
            if let data = response.result.value {
                let jsonData = JSON(data)["products"].arrayValue
                print("+++++++++++++++++")
                _cache = Array<Products>.init()
                var cnt = 0
                for json in jsonData {
                    _cache!.append(Products.init(
                        productKey: json["id"].intValue,
                        productImageUrl: json["images"][0]["name"].stringValue.replacingOccurrences(of:"\\", with: ""),
                        productName: json["title"].stringValue,
                        productPrice: json["pricing"]["price"].stringValue
                    ))
                    print("\(cnt) : \(json["title"].stringValue)")
                    cnt = cnt + 1
                }
                callback(_cache)
            }else{
                callback(nil)
            }
        }
    }
        
    
}
