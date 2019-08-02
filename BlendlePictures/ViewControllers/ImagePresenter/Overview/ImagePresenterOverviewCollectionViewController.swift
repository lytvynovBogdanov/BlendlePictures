//
//  ImagePresenterOverviewCollectionViewController.swift
//  BlendlePictures
//
//  Created by Oleksii Lytvynov-Bohdanov on 8/2/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

class ImagePresenterOverviewCollectionViewController: UICollectionViewController {
    
    var viewModel = ImagePresenterOverviewViewModel()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 80, height: 80)
        
        super.init(collectionViewLayout: layout)
        
        collectionView.backgroundColor = .white
        bind()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        viewModel.picturesUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell(collectionView)
    }
}
