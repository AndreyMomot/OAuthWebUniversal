//
//  Defines.swift
//  OAuth2SafariUniversal
//
//  Created by Andrei Momot on 12/7/17.
//  Copyright © 2017 Andrey Momot. All rights reserved.
//

import Foundation

struct SOCIAL {
    
    static let REDIRECT_URI = "https://drmom.eu.auth0.com/login/callback"
    static let ACCESS_TOKEN =  "access_token"

    // MARK: - INSTAGRAM
    static let INSTAGRAM_AUTHURL = "https://api.instagram.com/oauth/authorize/"
    static let INSTAGRAM_CLIENT_ID  = "d4a8f1956a9144a784ba59ed0803a4e7"
    static let INSTAGRAM_SCOPE = "likes+comments+relationships"
    // static let INSTAGRAM_CLIENTSERCRET = " 8d5f12c0f4fc475c85a5b1fe52a6a539"
    //    static let INSTAGRAM_APIURl  = "https://api.instagram.com/v1/users/"
    
    // MARK: - GOOGLE
    static let GOOGLE_AUTHURL = "https://accounts.google.com/o/oauth2/auth"
    static let GOOGLE_CLIENT_ID = "68328860856-49jmu962guog7gbn6tjvuv76dof0ji45.apps.googleusercontent.com"
    static let GOOGLE_SCOPE = "profile+email"
    //  static let GOOGLE_CLIENTSERCRET = "ECnq8ufuEL5ENz1oj1j9-viM"
    //   static let GOOGLE_ACCESS_TOKEN =  "access_token"
    
    // MARK: - FACEBOOK
    static let FACEBOOK_AUTHURL = "https://www.facebook.com/dialog/oauth"
    static let FACEBOOK_CLIENT_ID = "1147796252020668"
    static let FACEBOOK_SCOPE = "public_profile+email"
    //    static let FACEBOOK_CLIENTSERCRET = "718a8adf7071ab7ed5612844d325c2a1"
    //   static let FACEBOOK_ACCESS_TOKEN =  "access_token"
    
    // MARK: - TWITTER
    static let TWITTER_AUTHURL = "https://api.twitter.com/oauth/authenticate"
    static let TWITTER_CLIENT_ID = "907573014287482880-ZTtQXY0TqmcqvUjRI5IIM9PY6pnRkUq"
    static let TWITTER_SCOPE = "profile"
    //   static let TWITTER_CLIENTSERCRET = "UWuK8ZFIEoubmR2FsFaSgvkS2dtHlGue86vKgsyrlBq72sPfGH"
    //  static let TWITTER_ACCESS_TOKEN =  "907573014287482880-ZTtQXY0TqmcqvUjRI5IIM9PY6pnRkUq"
    
    // MARK: - WEIBO
    static let WEIBO_AUTHURL = "https://api.weibo.com/oauth2/authorize"
    static let WEIBO_Client_ID = ""
    static let WEIBO_SCOPE = "user"
    
    // MARK: - WECHAT
    static let WECHAT_AUTHURL = ""
    static let WECHAT_Client_ID = ""
    static let WECHAT_SCOPE = ""
    
    // MARK: - QQ
    static let QQ_AUTHURL = ""
    static let QQ_Client_ID = ""
    static let QQ_SCOPE = ""
}
