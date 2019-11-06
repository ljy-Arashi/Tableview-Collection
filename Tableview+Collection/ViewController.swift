//
//  ViewController.swift
//  Tableview+Collection
//
//  Created by 刘佳艳 on 2019/11/06.
//  Copyright © 2019 刘佳艳. All rights reserved.
//

import UIKit

//每月书籍
struct BookPreview {
    var title:String
    var images:[String]
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //tableView
    @IBOutlet weak var tableView: UITableView!
    //所有书籍数据
    let books = [
        BookPreview(title: "五月新书", images: ["0.jpg", "1.jpg","2.jpg", "3.jpg",
                                                    "4.jpg","5.jpg","6.jpg"]),
        BookPreview(title: "六月新书", images: ["7.jpg", "8.jpg", "9.jpg"]),
        BookPreview(title: "七月新书", images: ["10.jpg", "11.jpg", "12.jpg", "13.jpg"])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //设置tableView代理
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        //去除单元格分隔线
        //self.tableView!.separatorStyle = .none
                
        //创建一个重用的单元格
        //self.tableView!.register(TableViewCell.self, forCellReuseIdentifier: "Tcell")
        self.tableView!.register(UINib(nibName:"TableViewCell", bundle:nil),
        forCellReuseIdentifier:"Tcell")
//        //设置estimatedRowHeight属性默认值
//        self.tableView!.estimatedRowHeight = 44.0
//        //rowHeight属性设置为UITableViewAutomaticDimension
//        self.tableView!.rowHeight = UITableViewAutomaticDimension
    }
    
    //区分
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    //cell内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Tcell", for: indexPath) as! TableViewCell
        
        //下面这两个语句一定要添加，否则第一屏显示的collection view尺寸，以及里面的单元格位置会不正确
//        cell.frame = tableView.bounds
//        cell.layoutIfNeeded()
       
        cell.reloadData(title: books[indexPath.row].title, images: books[indexPath.row].images)
        return cell
    }
    


}

