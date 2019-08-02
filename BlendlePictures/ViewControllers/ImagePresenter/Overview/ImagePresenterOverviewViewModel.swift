//
//  ImagePresenterOverviewViewModel.swift
//  BlendlePictures
//
//  Created by Oleksii Lytvynov-Bohdanov on 8/2/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import Foundation

class ImagePresenterOverviewViewModel {
    private var pictures: [Picture] {
        didSet {
            picturesUpdated?()
        }
    }
    
    var picturesUpdated: (() -> Void)?
    
    var lastLoadedPage = 0
    
    private var isLoadingData = false
    
    init() {
        pictures = []
        loadData()
    }
    
    func loadData() {
        if isLoadingData {
            return
        }
        
        lastLoadedPage += 1
        isLoadingData = true
        FlickrApi.fetchPhotos(with: lastLoadedPage) { [weak self] (urls, error) in
            self?.isLoadingData = false
            if let pictures = urls?.map({ Picture(url: $0) }) {
                self?.pictures += pictures
            }
        }
    }
    
    func picture(at indexPath: IndexPath) -> Picture? {
        guard indexPath.row < pictures.count else { return nil }
        return pictures[indexPath.row]
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfItems(in section: Int) -> Int {
        return pictures.count
    }
}
