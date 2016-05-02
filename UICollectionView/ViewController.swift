//
//  ViewController.swift
//  UICollectionView
//
//  Created by 刘高晖 on 16/5/2.
//  Copyright © 2016年 刘高晖. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        //Layout决定了UICollectionView是如何显示在界面上的。在展示之前，一般需要生成合适的UICollectionViewLayout子类对象，并将其赋予CollectionView的collectionViewLayout属性
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical  //滚动方向
        layout.itemSize = CGSizeMake(CGRectGetWidth(self.view.bounds)/3, CGRectGetWidth(self.view.bounds)/3) //设置所有cell的size  太重要了 找了半天。(自学就是辛苦呀！！)
//        layout.sectionInset = UIEdgeInsetsZero
        layout.minimumLineSpacing = 0  //上下间隔
        layout.minimumInteritemSpacing = 0 //左右间隔
        layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 20)//设置collectionView头视图的大小
       layout.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 20)//设置
        
        
        
        let collect:UICollectionView = UICollectionView(frame: self.view.frame,collectionViewLayout:layout)
        collect.delegate = self
        collect.dataSource = self
        collect.backgroundColor = UIColor.whiteColor()
      
        //注册collectionView
        collect.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        //注册collectionView头视图
        collect.registerClass(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headcell")
        //注册collectionView底部视图
                collect.registerClass(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footcell")
        self.view.addSubview(collect)
        
    
    }
    
    
    //设置分区个数
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    //设置每个分区元素个数
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 5
        }
        return  10
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
      
        if kind == UICollectionElementKindSectionHeader{
           let head = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "headcell", forIndexPath: indexPath)
            head.backgroundColor = UIColor.blueColor()
            return head
        }
        if kind == UICollectionElementKindSectionFooter{
            let foot = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "footcell", forIndexPath: indexPath)
            foot.backgroundColor = UIColor.yellowColor()
            return foot
        }
        return UICollectionReusableView()
    }
   
    
    //设置元素内容
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //这里创建cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

