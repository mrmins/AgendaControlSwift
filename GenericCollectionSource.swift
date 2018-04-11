//
//  GenericCollection.swift
//  ExcelAgenda
//
//  Created by IT Regional on 9/4/18.
//  Copyright © 2018 IT Regional. All rights reserved.
//

import Foundation
import UIKit

class GenericCollectionSource: NSObject, UICollectionViewDataSource {
    
    var shortDayNames:[String] = ["Su","Mo","Tu","We","Th","Fr","Sa"]
    var shortMonthNames:[String] = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre",]
    var dayNames:[String] = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"]
    var months:[String] = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
    var disabledDays:[Int]=[0,6]
    var calendar = [String]()
    var emptyDays = [String]()
    
    var activities = [String]()
    
    private var dayOfWeek:Int=0
    var date:Date = Date()
    
    init(calendarDayNames:[String]=[String]()){
        //shortDayNames = calendarDayNames
        super.init()
        fillDays()
    }
    
    func fillDays(){
        let start = Date().startOfMonth()
        let cal = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let startingWith = cal!.components([.weekday], from: start).weekday! - 1
        
        if(startingWith > 0){
            for _ in 1...startingWith {
                emptyDays.append("")
                dayOfWeek+=1
            }
        }
        
        let daysInMonth = date.getDaysInTheCurrentMonth()
        for i in 1...daysInMonth {
            calendar.append("\(i)")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (shortDayNames.count + emptyDays.count + calendar.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "agendaCell", for: indexPath)
        
        let viewWidth = (collectionView.frame.width / CGFloat(shortDayNames.count))
        let viewHeight = (collectionView.frame.height / 7)
        
        let wh = (((viewWidth > viewHeight) ? viewHeight : viewWidth) - CGFloat(20))
        
        if(indexPath.row < 7) {
            let view = GenericControls.LabelOverView(text: "\(shortDayNames[indexPath.row].uppercased())", width: Int(wh), height: Int(wh), bgColor: UIColor().hexStringToUIColor(hex: "#b12229"), bgRounded: true, borderWidth: 0, textColor: UIColor.white, labelTag: -1, textWeight: UIFont.Weight.bold, textAligment: NSTextAlignment.center)
            cell.contentView.addSubview(view)
            cell.tag = -1
        } else if (indexPath.row < (shortDayNames.count + emptyDays.count) ){
            //The no redenered days (because are part of the previous month)
        } else if( (indexPath.row ) < (shortDayNames.count + calendar.count + emptyDays.count )){
            //Print calendar dates
            let index = (indexPath.row - emptyDays.count - shortDayNames.count )
            if(disabledDays.index(where: { $0 == dayOfWeek }) != nil){
                //as gray
                let label = GenericControls.Label(text: "\(calendar[index])", width: Int(wh), height: Int(wh), tag: indexPath.row, textWeight: UIFont.Weight.light, underline: true, color: UIColor.lightGray)
                cell.contentView.addSubview(label)
            }else{
                let label = GenericControls.Label(text: "\(calendar[index])", width: Int(wh), height: Int(wh), tag: indexPath.row, textWeight: UIFont.Weight.light, underline: true, color: UIColor.black)
                cell.contentView.addSubview(label)
            }
            dayOfWeek+=1
        } else {
            //Blank dates DO NOTHING and delete this else
            //Not rendered because are part of the next month
        }
        if(dayOfWeek == 7){
            dayOfWeek = 0
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Calendar element pushed! \(indexPath.row)")
        //agendaFechha.text = "\(row)"
    }
    

}
