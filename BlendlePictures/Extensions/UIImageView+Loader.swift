//
//  UIImageView+Loader.swift
//  BlendlePictures
//
//  Created by Oleksii Lytvynov-Bohdanov on 8/2/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

extension UIImageView {
    private func emptyImage() -> UIImage? {
        return UIImage(named: "EmptyImage")
    }
    
    func setImage(url: URL?) {
        guard let url = url else {
            self.image = emptyImage()
            return
        }
        if let image = ImageWorker.shared.imageFromCache(url: url) {
            self.image = image
        } else {
            self.image = emptyImage()
            self.downloaded(from: url, contentMode: .scaleAspectFill)
        }
    }
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                ImageWorker.shared.addImageToCache(image: image, url: url)
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
