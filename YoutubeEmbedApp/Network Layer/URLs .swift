//
//  URLs .swift
//  AwfarlakOriginal
//
//  Created by Mustafa on 2/16/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import Foundation

class URLs {
    
    
    
    // MARK: - The BasicPath
    
    static let baseURL = "https://www.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&maxResults=5&key="

    //MARK:- Complete Path
    
    static let registerURL = "https://www.hatly.be4maps.com/api/auth/register"
    static let apiKey = baseURL + "AIzaSyBIOWykpurpY1Y3sMQ-18Aix8ABdu6PqWk"
    static let forgetPasswordURL = baseURL + "user/forget_pass/549834453/25598"
    static let getAllCategories = baseURL + "Category/getAllMainCategories/549834453/25598"
    static let getSubCategories = baseURL + "Category/getMainCategorySubCategories/549834453/25598"
    static let getAllProductOfSubCategories = baseURL + "Category/getAllProduct/549834453/25598"
    static let addFavoriteProduct = baseURL + "User/addFavoriteProduct/549834453/25598"
    static let deleteFavoriteProduct = baseURL + "User/deleteFavoriteOffers/549834453/25598"
    static let getFavoriteProduct = baseURL + "User/getFavoriteOffers/549834453/25598"
    static let productDetails = baseURL + "Product/productdetails/549834453/25598"
    static let addRate = baseURL + "user/addRate/549834453/25598"
    static let getComments = baseURL + "comments/view_offer_comments/549834453/25598"
    static let addComments = baseURL + "comments/add_comment/549834453/25598"
    static let editProfile = baseURL + "user/editProfile/549834453/25598"
    static let viewProfile = baseURL + "User/view/549834453/25598"
    static let changePassword = baseURL + "User/update_password/549834453/25598"
    static let faq = baseURL + "Question/View/549834453/25598"
    static let sendOrder = baseURL + "cart/sendOrder/549834453/25598"
    static let search = baseURL + "Product/searchByName/549834453/25598"









}

