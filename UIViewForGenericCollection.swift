//
//  UIViewForGenericCollection.swift
//  ExcelAgenda
//
//  Created by IT Regional on 9/4/18.
//  Copyright © 2018 IT Regional. All rights reserved.
//

import Foundation
import UIKit

class UIViewForGenericCollection {
    
    func generateCalendar(view:UIView, datasource:GenericCollectionSource, btnPreviousSelector:Selector, btnNextSelector:Selector) -> UICollectionView {
        
        let viewWidth = (view.frame.width / 7)
        let viewHeight = (view.frame.height / 7)
        
        let wh = (((viewWidth > viewHeight) ? viewHeight : viewWidth) - CGFloat(10))
        
        let header = GenericControls.LabelOverView(text: "APRIL", width: Int(view.frame.width), height: 50, bgColor: UIColor().hexStringToUIColor(hex: "#b12229"), textColor: UIColor.white, textWeight: UIFont.Weight.bold, textAligment: NSTextAlignment.center)
        
        let btnLeft = GenericControls.Button(text: "<", x: 10, y: 10, width: 30, height: 30)
        btnLeft.addTarget(self, action: btnPreviousSelector, for: .touchUpInside)
        header.addSubview(btnLeft)
        
        let btnRight = GenericControls.Button(text: ">", x: (Int(view.frame.width - 40)), y: 10, width: 30, height: 30)
        btnRight.addTarget(self, action: btnPreviousSelector, for: .touchUpInside)
        header.addSubview(btnRight)
        
        view.addSubview(header)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: wh, height: wh)
        
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "agendaCell")
        collectionView.backgroundColor = UIColor.white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = datasource
        view.addSubview(collectionView)
        return collectionView
    }
    
    @objc func buttonLeft(sender: UIButton!) {
        print("Button tapped")
    }

}
