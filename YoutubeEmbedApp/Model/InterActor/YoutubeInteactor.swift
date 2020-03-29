//
//  YoutubeInteactor.swift
//  callApi
//
//  Created by Mustafa on 3/28/20.
//  Copyright © 2020 Mostafa. All rights reserved.
//

import Alamofire
import Foundation
class YoutubeInteractor {
    
       
           func getYoutubeData(part: String, channelId: String ,callback: @escaping (YoutubeModel , Int ) -> Void, failureHandler: @escaping (Error,Int) -> Void) {
              let url = URLs.apiKey
              let parameters = ["part": part, "channelId": channelId]
              Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:nil, callBack: { (response: YoutubeModel , Int )   in
                  callback(response, Int)
              }) { (error,Int)  in
                  failureHandler(error,Int)
              }
          }
}
