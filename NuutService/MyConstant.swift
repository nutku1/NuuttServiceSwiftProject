//
//  MyConstant.swift
//  NuutService
//
//  Created by TST-APP-01 on 16/1/2562 BE.
//  Copyright © 2562 Nuutt. All rights reserved.
//

import Foundation

class MyConstant {
    let urlAddUser:String = "https://www.androidthai.in.th/hit/addUserNut.php?isAdd=true&Name="
    let urlGetUser:String = "https://www.androidthai.in.th/hit/getUserWhereUserNut.php?isAdd=true&User="
    
    
    func getUrlAddUser() -> String {
        return urlAddUser
    }
    
    func getUrlGetUser(user:String) -> String {
        let result = "\(urlGetUser)\(user)"
        return result
    }
}
