//
//  APIClient.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import UIKit

typealias Method = Alamofire.HTTPMethod

class APIClient {
    
    func request(_ urlString: String, method: Method, parameters: Parameters? = nil, onSuccess: @escaping (Data) -> Void, onFailure: @escaping () -> Void) {
        
        let url = URL(string: urlString)
        let method = method
        let parameters = parameters
        let encoding = URLEncoding.default
        let headers = Alamofire.SessionManager.defaultHTTPHeaders
        
        let request = Alamofire.request(url!, method: method, parameters: parameters, encoding: encoding, headers: headers)
        
        request
            .validate()
            .responseData { (responseData) in
                guard let data = responseData.data else {
                    return onFailure()
                }
                onSuccess(data)
        }
    }
    
    func loadRemoteImage(_ urlString: String, onCompletion: @escaping (UIImage?) -> Void) {
        Alamofire.request(urlString).responseImage { response in
            onCompletion(response.result.value)
        }
    }
}
