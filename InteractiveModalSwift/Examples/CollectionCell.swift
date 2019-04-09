//
//  CollectionCell.swift
//  InteractiveModalSwift
//
//  Created by Usue Napal on 09/04/2019.
//  Copyright © 2019 Usit Development. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell
{
    @IBOutlet var imageView: UIImageView?

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    public func configureCellWithImageUrl(url: URL)
    {
        DispatchQueue.global().async {
            do {
                let imgData = try Data.init(contentsOf: url)
                
                DispatchQueue.main.async {
                    self.imageView?.image = UIImage.init(data: imgData)
                }
            } catch _ {
                NSLog("Error getting image.")
            }
        }
    }
}
