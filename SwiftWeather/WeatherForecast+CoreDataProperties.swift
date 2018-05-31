//
//  WeatherForecast+CoreDataProperties.swift
//  SwiftWeather
//
//  Created by Uttarakawatam, Santosh on 22/05/18.
//  Copyright © 2018 Jake Lin. All rights reserved.
//
//

import Foundation
import CoreData


extension WeatherForecast {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherForecast> {
        return NSFetchRequest<WeatherForecast>(entityName: "WeatherForecast")
    }

    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var dateId: String?
    @NSManaged public var humidity: String?
    @NSManaged public var iconText: String?
    @NSManaged public var pressure: String?
    @NSManaged public var temperature: String?

}
