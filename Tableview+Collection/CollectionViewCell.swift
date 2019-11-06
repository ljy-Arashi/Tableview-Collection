//
//  CollectionViewCell.swift
//  Tableview+Collection
//
//  Created by 刘佳艳 on 2019/11/06.
//  Copyright © 2019 刘佳艳. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
//awakeFromNib是在初始化完成后调用，所以在这个方法里面访问属性（IBOutlet）就可以保证不为nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
