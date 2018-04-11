//
//  AgendaGenericTableSource.swift
//  ExcelAgenda
//
//  Created by IT Regional on 10/4/18.
//  Copyright © 2018 IT Regional. All rights reserved.
//

import Foundation
import UIKit

class AgendaGenericTableSource:NSObject, UITableViewDataSource {
    
    var height = 80
    var availableSchedule:[Int] = [7,18]
    var format24Hours: Bool = false
    var hours:[String]=[String]()
    
    override init(){
        super.init()
        fillHours()
    }
    
    private func fillHours(){
        hours = [String]()
        let start = availableSchedule[0]
        let end = availableSchedule[1]
        
        if(format24Hours){
            for i in start...end {
                hours.append("\(i)")
            }
            return
        }
        for i in start...end {
            if(i>12 && i<23){
                let temp = i - 12;
                hours.append("\(temp) PM")
            }else if(i == 24){
                hours.append("\0 AM")
            }else{
                hours.append("\(i) AM")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let hourColor = UIColor().hexStringToUIColor(hex: "#3564af")
        let label = GenericControls.Label(text: "\(hours[indexPath.row])", x: 0, y: 0, width: 55, height: 60, textWeight: UIFont.Weight.light, textAligment: NSTextAlignment.right, color: hourColor)
        cell.contentView.addSubview(label)
        
        cell.backgroundColor = UIColor.clear
        cell.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor().hexStringToUIColor(hex: "#0494ff")
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(height)
    }
    
}
