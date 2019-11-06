//
//  TableViewCell.swift
//  Tableview+Collection
//
//  Created by 刘佳艳 on 2019/11/06.
//  Copyright © 2019 刘佳艳. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    //collectionView的高度约束
    @IBOutlet weak var collectionViewHight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    //封面数据
    var images:[String] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //设置collectionView的代理  必须实现protocal 这里写在下面extension
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
                 
         // 注册CollectionViewCell
        self.collectionView!.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cCell")
       
    }

    //加载数据
        func reloadData(title:String, images:[String]) {
            //设置标题
            self.lbTitle.text = title
            //保存图片数据
            self.images = images
            //collectionView重新加载数据
            self.collectionView.reloadData()
             
            //更新collectionView的高度约束
            let contentSize = self.collectionView.collectionViewLayout.collectionViewContentSize
            collectionViewHight.constant = contentSize.height
             
            self.collectionView.collectionViewLayout.invalidateLayout()
        }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension TableViewCell:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cCell", for: indexPath) as!CollectionViewCell
        cell.imageView.image = UIImage(named: images[indexPath.item])
        return cell
        
    }
    
    
}
