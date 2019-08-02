//
//  ImageSourceTableDataSource.swift
//  BlendlePictures
//
//  Created by Oleksii Lytvynov-Bohdanov on 8/2/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

extension ImageSourceTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.imageSourceCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageSourceTableViewController.classString, for: indexPath)
        guard let imageSource = viewModel.imageSource(at: indexPath) else {
            assertionFailure()
            return cell
        }
        cell.textLabel?.text = imageSource.name
        
        return cell
    }
}
