//
//  ImageWorker.swift
//  BlendlePictures
//
//  Created by Oleksii Lytvynov-Bohdanov on 8/2/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

typealias ImageHandler = (_ image:UIImage) -> Void

private class ImageCache {
    var images = [String:UIImage]()
    
    func setImage(image: UIImage, forKey key: String) {
        images[key] = image
    }
    
    func imageForKey(key: String) -> UIImage? {
        return images[key]
    }
    
    func removeAll() {
        images.removeAll()
    }
}

class ImageWorker {
    
    init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.resetCache),
            name:
            UIApplication.didReceiveMemoryWarningNotification,
            object: nil)
    }
    
    private let imageCache:ImageCache = ImageCache()
    
    static let shared:ImageWorker = ImageWorker()
    
    func imageFromCache(url:URL) -> UIImage? {
        guard let image = imageCache.imageForKey(key: url.absoluteString) else { return nil }
        return image
    }
    
    func addImageToCache(image: UIImage, url: URL) {
        imageCache.setImage(image: image, forKey: url.absoluteString)
    }
    
    @objc func resetCache() {
        imageCache.removeAll()
    }
    
    func deallooc() {
        NotificationCenter.default.removeObserver(self)
    }
}
