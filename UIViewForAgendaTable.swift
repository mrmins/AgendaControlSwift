//
//  UIViewForAgendaTable.swift
//  ExcelAgenda
//
//  Created by IT Regional on 10/4/18.
//  Copyright © 2018 IT Regional. All rights reserved.
//

import Foundation
import UIKit

class UIViewForAgendaTable {
    
    var table: UITableView = UITableView()
    var searchBar: UISearchBar = UISearchBar()
    
    func generateTable(view:UIView, datasource:AgendaGenericTableSource, dateControl:Bool=true) {
        var verticalGap = 0
        
        if(dateControl){
            let dateControlView = GenericControls.View(x: 0, y: 0, width: Int(view.frame.size.width), height: 80, color: UIColor.clear)
            
            let monthLabel = GenericControls.Label(text: "April 2011", x: 0, y: 5, width: Int(view.frame.size.width - 20), height: 20, textWeight: UIFont.Weight.ultraLight, textAligment: NSTextAlignment.right, color: UIColor.white)
            dateControlView.addSubview(monthLabel)
            
            let dateLabel = GenericControls.Label(text: "Wednesday 11", x: 0, y: 40, width: Int(view.frame.size.width), height: 40, textWeight: UIFont.Weight.bold, textAligment: NSTextAlignment.center, color: UIColor.black)
            dateControlView.addSubview(dateLabel)
            
            let btnLeft = GenericControls.Button(text: "<", x: 10, y: 45, width: 40, height: 30, bgColor: UIColor.clear, textColor: UIColor.black)
            btnLeft.addTarget(self, action: #selector(buttonLeft), for: .touchUpInside)
            dateControlView.addSubview(btnLeft)
            
            let btnRight = GenericControls.Button(text: ">", x: (Int(view.frame.width - 40)), y: 45, width: 30, height: 30, bgColor: UIColor.clear, textColor: UIColor.black)
            btnRight.addTarget(self, action: #selector(buttonLeft), for: .touchUpInside)
            dateControlView.addSubview(btnRight)
            
            view.addSubview(dateControlView)
            verticalGap+=100
        }
        
        //CREATION AND TABLE POPULATION
        table = UITableView(frame: CGRect(x: 0 , y: CGFloat(verticalGap), width: view.frame.size.width, height: view.frame.size.height))
        table.dataSource = datasource
        table.backgroundColor = UIColor.clear
        view.addSubview(table)
    }
    
    @objc func buttonLeft(){
        
    }
    
}
