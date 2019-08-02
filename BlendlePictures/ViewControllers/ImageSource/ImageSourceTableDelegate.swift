//
//  ImageSourceTableDelegate.swift
//  BlendlePictures
//
//  Created by Oleksii Lytvynov-Bohdanov on 8/2/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

extension ImageSourceTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let imageSource = viewModel.imageSource(at: indexPath) else {
            assertionFailure()
            return
        }

        let viewController = imageSource.controllerClass.init() 
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
