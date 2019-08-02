//
//  ImageSourceTableViewModel.swift
//  BlendlePictures
//
//  Created by Oleksii Lytvynov-Bohdanov on 8/2/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import Foundation

struct ImageSourceTableViewModel {
    private let imageSources: [ImageSource]
    
    init(imageSources: [ImageSource]) {
        self.imageSources = imageSources
    }
    
    var imageSourceCount: Int {
        return imageSources.count
    }
    
    func imageSource(at indexPath: IndexPath) -> ImageSource? {
        guard indexPath.row < imageSources.count else { return nil }
        return imageSources[indexPath.row]
    }
}
