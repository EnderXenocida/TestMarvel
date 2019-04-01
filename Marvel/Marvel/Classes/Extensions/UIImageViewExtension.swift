//
//  UIImageViewExtension.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadRemoteImage(_ url: String?) {
        guard let url = url else {
            self.image = nil
            return
        }
        APIClient().loadRemoteImage(url) { (image) in
            self.image = image
        }
    }
}
