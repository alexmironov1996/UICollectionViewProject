//
//  ViewController.swift
//  table
//
//  Created by macbook on 03.07.16.
//  Copyright © 2016 macbook. All rights reserved.
//

import UIKit
import LoremIpsum
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private var _collectionView:UICollectionView!
    private var _items:[String]=[String]()    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandomValues()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        layout.estimatedItemSize = CGSize(width: view.bounds.width, height: 90)
        //layout.itemSize = CGSize(width: view.bounds.width, height: 90)
        
        
        
        _collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        _collectionView.translatesAutoresizingMaskIntoConstraints=false
        _collectionView.delegate      =   self
        _collectionView.dataSource    =   self
        
        _collectionView.registerClass(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        _collectionView.backgroundColor=UIColor.whiteColor()
        
        view.addSubview(_collectionView)
        NSLayoutConstraint.activateConstraints([
                _collectionView.topAnchor.constraintEqualToAnchor(view.topAnchor),
                _collectionView.leftAnchor.constraintEqualToAnchor(view.leftAnchor),
                _collectionView.rightAnchor.constraintEqualToAnchor(view.rightAnchor),
                _collectionView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor),
            
                (layout.collectionView?.topAnchor.constraintEqualToAnchor(_collectionView.topAnchor))!,
                (layout.collectionView?.rightAnchor.constraintEqualToAnchor(_collectionView.rightAnchor))!,
                (layout.collectionView?.leftAnchor.constraintEqualToAnchor(_collectionView.leftAnchor))!,
                (layout.collectionView?.bottomAnchor.constraintEqualToAnchor(_collectionView.bottomAnchor))!,
            
            
            ])

        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor=UIColor.whiteColor()

        cell.smthImage.image=UIImage(named: "alien.png")
        cell.smthTextLabel.text=_items[indexPath.row]
        cell.smthViewFirst.text="one"
        cell.smthViewSecond.text="two"
        cell.smthViewThird.text="three"
        

        print(_items[indexPath.row])
        return cell

    }

    func setRandomValues(){
        let randomCount:UInt32=arc4random_uniform(10)
        print(randomCount)
        for _ in 0...randomCount{
            _items.append(LoremIpsum.wordsWithNumber(22))
        }
    }

}

