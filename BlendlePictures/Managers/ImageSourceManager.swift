//
//  ImageSourceManager.swift
//  BlendlePictures
//
//  Created by Oleksii Lytvynov-Bohdanov on 8/2/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import Foundation

struct ImageSourceManager {
    static var all: [ImageSource] {
        let imageSource = ImageSource(name: "Flicker", controllerClass: ImagePresenterOverviewCollectionViewController.self)
        return [imageSource]
    }
}
