//
//  Constants.swift
//  Pixel City
//
//  Created by Vibhanshu Vaibhav on 26/09/17.
//  Copyright © 2017 Vibhanshu Vaibhav. All rights reserved.
//

import Foundation

func flickrURL(forAPIKey key: String, withAnnotation annotation: DroppablePin, andNumberOfPages number: Int) -> String {
    return "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(key)&lat=\(annotation.coordinate.latitude)&lon=\(annotation.coordinate.longitude)&radius=1&radius_units=km&per_page=\(number)&format=json&nojsoncallback=1"
}

func flickrInfo(forAPIKey key: String, withPhotoId photoId: String, andSecretId secretId: String) -> String {
    return "https://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=\(API_KEY)&photo_id=\(photoId)&secret=\(secretId)&format=json&nojsoncallback=1"
}

