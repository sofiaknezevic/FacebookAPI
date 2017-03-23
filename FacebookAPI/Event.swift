//
//  Event.swift
//  FacebookAPI
//
//  Created by Scott Hetland on 2017-03-23.
//  Copyright © 2017 Scott Hetland. All rights reserved.
//

import UIKit

class Event: NSObject {
    
    var eventDescription: String?
    var endTime: Date?
    var eventName: String?
    var placeName: String?
    var cityName: String?
    var countryName: String?
    var latitute: Double?
    var longitude: Double?
    var state: String?
    var street: String?
    var zipCode: String?
    var eventID: String?
    var placeID: String?
    var startTime: Date?
    var rsvpStatus: String?
        
    //what more I need
//    var hostID: String?
//    var coverPhoto: UIImage?
//    var attendingCount: Int?
    //want to get names of who is attending
    
    
    class func parseDataFromJSON( _ json: [String: Any]) -> Event {

        let newEvent = Event()
        
        //ones that are not nested
        newEvent.eventDescription = json["description"] as? String
        newEvent.endTime = json["end_time"] as? Date
        newEvent.eventName = json["name"] as? String
        newEvent.startTime = json["start_time"] as? Date
        newEvent.eventID = json["id"] as? String
        newEvent.rsvpStatus = json["rsvp_status"] as? String
        
        //nested in place
        if let place = json["place"] as? [String:Any] {
        newEvent.placeName = place["name"] as? String
        newEvent.placeID = place["id"] as? String
        }
        
        //nested in location
        if let place = json["place"] as? [String:Any] {
            if let location = place["location"] as? [String:Any] {
                newEvent.cityName = location["city"] as? String
                newEvent.countryName = location["country"] as? String
                newEvent.latitute = location["latitude"] as? Double
                newEvent.longitude = location["longitude"] as? Double
                newEvent.state = location["state"] as? String
                newEvent.zipCode = location["zip"] as? String
            }
        }
        
        return newEvent
    }
}
