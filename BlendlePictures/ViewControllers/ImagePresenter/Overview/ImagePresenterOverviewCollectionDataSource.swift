//
//  ImagePresenterOverviewCollectionDataSource.swift
//  BlendlePictures
//
//  Created by Oleksii Lytvynov-Bohdanov on 8/2/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

extension ImagePresenterOverviewCollectionViewController {
    
    private var feedPictureIdentifier: String {
        return FeedPicturesCollectionViewCell.classString
    }
    
    func registerCell(_ collectionView: UICollectionView) {
        let nib = UINib(nibName: feedPictureIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: feedPictureIdentifier)
        //        self.collectionView.register(FeedPicturesCollectionViewCell.self, forCellWithReuseIdentifier: FeedPicturesCollectionViewCell.classString)

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedPictureIdentifier, for: indexPath) as? FeedPicturesCollectionViewCell,
            let picture = viewModel.picture(at: indexPath) else {
            assertionFailure()
            return UICollectionViewCell()
        }
        cell.fullImageView.setImage(url: picture.url)
        
        return cell
    }

}
