//
//  APIHandler.swift
//  Mart
//
//  Created by Genie Mae Lorena Edera on 9/8/18.
//  Copyright © 2018 Genie Mae Lorena Edera. All rights reserved.
//

import Foundation
import Alamofire

class APIHandler {
    
    static func getProductListFromApi(callback: @escaping (DataResponse<Any>)-> Void) {
        let targetURL: String = "https://api.redmart.com/v1.6.0/catalog/search?theme=all-sales&pageSize=30&page=0"
        Alamofire.request(targetURL, headers: nil).responseJSON(completionHandler: callback)
    }
}
