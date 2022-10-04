//
//  APICallManager.swift
//  Lesson 4
//
//  Created by Anton Lebedev on 11.05.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

let apiBaseUrl = "https://www.metaweather.com/api"

class APICallManager {
    static let shared = APICallManager()
    
    /// JSON is parsed and returned to WeatherService
    func createRequest(
        _ url: String,
        method: HTTPMethod,
        headers: [String: String]?,
        parameters: AnyObject?,
        onSuccess successCallback: ((JSON) -> Void)?,
        onFailure failureCallback: ((String) -> Void)?
    ) {
        AF.request(url, method: method).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                successCallback?(json)
            case .failure(let error):
                if let callback = failureCallback {
                    callback(error.localizedDescription)
                }
            }
            print(response)
        }
    }
}
