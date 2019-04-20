//
//  Profile.swift
//  Savinglife
//
//  Created by Kanyanee P on 20/2/2562 BE.
//  Copyright © 2562 Kanyanee P. All rights reserved.
//

import Foundation
struct ProfileSenior: Codable {
    var DataSenior: DataSenior?
    var Healthdata: HealthData?
    var Location: Location?
    var ProfileURL: URLL?
}
struct ProfileCare: Codable {
    var Name_Care: String?
    var Tel_Care: String?
    var Role: String?
    //var Followed: [String: String]? //as Dictionary
    //var Followed: String? //as normal st5ring
    var Followed: [String]? //as array
}
struct HealthData: Codable {
    var Dailysteps: Double?
    var Heartrate: String?
    var Weeklysteps: Double?
    var FlightsClimbedWeekly: Double?
    var FlightsClimbedToday: Double?
    
}
struct DataSenior: Codable {
    var Name_Senior: String?
    var Role: String?
    var Tel_Senior: String?
}

struct Location: Codable {
    var LocationID: String?
    var LocationX: String?
    var LocationY: String?
}
struct URLL: Codable {
    var URL: String?
}

/*
struct followed: Codable {
    var autoID: String?
    var text: String?
    enum CodingKeys: String, CodingKeys {
        case text = "#text"
        case autoID
    }
}*/

