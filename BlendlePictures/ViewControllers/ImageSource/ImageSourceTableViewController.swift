//
//  ImageSourceTableViewController.swift
//  BlendlePictures
//
//  Created by Oleksii Lytvynov-Bohdanov on 8/2/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

class ImageSourceTableViewController: UITableViewController {
    
    let viewModel: ImageSourceTableViewModel
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = ImageSourceTableViewModel(imageSources: ImageSourceManager.all)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
