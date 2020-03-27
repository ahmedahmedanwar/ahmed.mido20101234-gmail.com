//
//  ErrorHandling.swift
//  YoutubeEmbedApp
//
//  Created by Omar Adel on 3/26/20.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation

class ErrorHandler : Decodable{
    var message : String?
    var errors : ErrorTypes?
    func parseError() -> String {
        var str = ""
        if let temp = self.errors?.email{
            if temp.count != 0{
                str.append(temp[0])
                str.append("\n")
                
            }
        }
        if let temp = self.errors?.name{
            if temp.count != 0{
                str.append(temp[0])
                str.append("\n")
                
            }
        }
        if let temp = self.errors?.message{
            if temp.count != 0{
                str.append(temp[0])
                str.append("\n")
                
            }
        }
        if let temp = self.errors?.password{
            if temp.count != 0{
                str.append(temp[0])
                str.append("\n")
                
            }
        }
        if let temp = self.errors?.avatar{
            if temp.count != 0{
                str.append(temp[0])
                str.append("\n")
                
            }
        }
        if let temp = self.errors?.day{
            if temp.count != 0{
                str.append(temp[0])
                str.append("\n")
                
            }
        }
        if let temp = self.errors?.user_code{
            if temp.count != 0{
                str.append(temp[0])
                str.append("\n")
                
            }
        }
        if let temp = self.errors?.mobile{
            if temp.count != 0{
                str.append(temp[0])
                str.append("\n")
                
            }
        }
        if let temp = self.errors?.errors{
            if temp.count != 0{
                str.append(temp[0])
                str.append("\n")
                
            }
        }
        if let temp = self.errors?.code{
            if temp.count != 0{
                str.append(temp[0])
                str.append("\n")
                
            }
        }

        return str
    }
    
    
}
struct ErrorImd : Decodable {
    var errors : ErrorTypes?
}
struct ErrorTypes : Decodable {
    var email : [String]?
    var password : [String]?
    var name : [String]?
    var avatar : [String]?
    var day : [String]?
    var mobile : [String]?
    var user_code : [String]?
    var errors : [String]?
    var message : [String]?
    var code : [String]?
}

struct ErrorData : Decodable {
    var message : String?
    var errors : ErrorTypes?
}
