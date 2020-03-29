//
//  Services.swift
//  Tigari
//
//  Created by Mustafa on 2/16/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit
import Alamofire


class Services {
    
  
    
   class func getYoutubeData(part: String, channelId: String ,callback: @escaping (YoutubeModel , Int ) -> Void, failureHandler: @escaping (Error,Int) -> Void) {
                 let url = URLs.apiKey
                 let parameters = ["part": part, "channelId": channelId]
                 Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: parameters, headers:nil, callBack: { (response: YoutubeModel , Int )   in
                     callback(response, Int)
                 }) { (error,Int)  in
                     failureHandler(error,Int)
                 }
             }
    
  
    
    
}
















