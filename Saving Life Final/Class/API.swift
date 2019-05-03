//
//  API.swift
//  Savinglife
//
//  Created by Kanyanee P on 23/1/2562 BE.
//  Copyright © 2562 Kanyanee P. All rights reserved.
//

import Foundation
import Firebase
import GoogleSignIn

//API Estimote

struct API {
    static let Estimote_API_appID: String = "Estimote_API_appID"
    static let Estimote_API_appToken: String = "Estimote_API_appToken"
    static let Estimote_API_locaionID: String = "Estimote_API_locaionID"
    

}

var xPoint: Double?
var yPoint: Double?
var ref: DatabaseReference!
var UID:String = ""
//let SeniorUID = Auth.auth().currentUser!.uid
//let SeniorUID = "0"
let SeniorUID = Auth.auth().currentUser!.uid
let CaregiverUID = Auth.auth().currentUser!.uid
