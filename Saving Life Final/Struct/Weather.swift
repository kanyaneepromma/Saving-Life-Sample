//
//  Weather.swift
//  Saving Life Final
//
//  Created by Kanyanee P on 20/4/2562 BE.
//  Copyright © 2562 Kanyanee P. All rights reserved.
//

import Foundation
struct Weather: Codable {
    let cod: String?
    let message: Double?
    let cnt: Int?
    let list: [List]?
    let city: City?
}

struct City: Codable {
    let id: Int?
    let name: String?
    let coord: Coord?
    let country: String?
}

struct Coord: Codable {
    let lat, lon: Double?
}

struct List: Codable {
    let dt: Int?
    let main: MainClass?
    let weather: [WeatherElement]?
    let clouds: Clouds?
    let wind: Wind?
    let sys: Sys?
    let dtTxt: String?
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, sys
        case dtTxt = "dt_txt"
    }
}

struct Clouds: Codable {
    let all: Int?
}

struct MainClass: Codable {
    let temp, tempMin, tempMax, pressure: Double?
    let seaLevel, grndLevel: Double?
    let humidity: Int?
    let tempKf: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

struct Sys: Codable {
    let pod: Pod?
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

struct WeatherElement: Codable {
    let id: Int?
    let main: MainEnum?
    let description: Description?
    let icon: String?
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case scatteredClouds = "scattered clouds"
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
}

struct Wind: Codable {
    let speed, deg: Double?
}


