# AgendaControlSwift
Agenda control for swift 4.0

Implement new controls is always annoying, complexity, implementation.

Now, you can create your own agenda, fully configurable, created in execution time.

What do you need?
Add to your `ViewController` two `@IBOutlet`.
You don't have to add anything more in your `storyboard`.

The first `UIView` renders the calendar, the second `UIView` renders the daily agenda.

What do you need? First one, an implemenation of your `datasource` for each one.

For example:

```
var dataSource = GenericCollectionSource()
var agendaDataSource = AgendaGenericTableSource()
```

With this declaration, some values for the component (not the components) are loaded, like hours, month, the calendar dates are on memroy, etc.

Now, you have to assign the `datasource` to each `UIView` using:
```
BenFrameworkTable.generateTable(view: agendaView, datasource: agendaDataSource)
```

If you want to retrive the `UITableView` you can use:
```
tableView = eaFrameworkTable.table 
```
And the same for the `UICalendarView datasource`:
```
let collection = BenFrameworkCollection.generateCalendar(view: calendarView, datasource: dataSource)
```

**What if I want to have my own `delegate` for each generated control?**
You can do it with: `UICollectionViewDelegate`


Usage example:

```
import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var agendaView: UIView!
    
    var dataSource = GenericCollectionSource()
    var agendaDataSource = AgendaGenericTableSource()
    let eaFrameworkCollection = UIViewForGenericCollection()
    let BenFrameworkTable = UIViewForAgendaTable()
    var tableView:UITableView=UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BenFrameworkTable.generateTable(view: agendaView, datasource: agendaDataSource)
        tableView = eaFrameworkTable.table
        
        let collection = BenFrameworkCollection.generateCalendar(view: calendarView, datasource: dataSource)
        collection.delegate = self
        collection.reloadData()
    }
    
    @objc func buttonLeft(_ sender: UIButton) {
        print("Left Button tapped")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Calendar element pushed! \(indexPath.row)")
        //agendaFechha.text = "\(row)"
    }
    
}
```

**The result:**

<img src='https://i.imgur.com/kK35pX2.png' />
