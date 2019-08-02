//
//  FlickrApi.swift
//  BlendlePictures
//
//  Created by Oleksii Lytvynov-Bohdanov on 8/2/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import Foundation
import FlickrKit

struct FlickrApi {
    private static let APIKey = "92111faaf0ac50706da05a1df2e85d82"
    private static let APISecret = "89ded1035d7ceb3a"
    
    static func fetchPhotos(with page: Int, complition: @escaping (([URL]?, Error?) -> Void)) {
        let flickr = FlickrKit.shared()
        flickr.initialize(withAPIKey: APIKey, sharedSecret: APISecret)
        let flickrInterestingness = FKFlickrInterestingnessGetList()
        flickrInterestingness.page = String(page)
//        flickrInterestingness.per_page = 100
        flickr.call(flickrInterestingness) { (response, error) in
            if let error = error {
                return complition(nil, error)
            }
            guard let photos = response?["photos"] as? [String: Any],
                let photo = photos["photo"] as? [[AnyHashable : Any]] else { return complition(nil, nil)}
            
            var photoUrls = [URL]()
            photo.forEach {
                let url = flickr.photoURL(for: .small240, fromPhotoDictionary: $0)
                photoUrls.append(url)
            }
            complition(photoUrls, nil)
        }
    }
}
