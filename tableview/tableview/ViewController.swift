//
//  ViewController.swift
//  tableview
//
//  Created by Bjit on 7/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addNewNumber(_ sender: Any) {
        
        insertNewNumber(name: nameField.text!, number: numberField.text!)
    }
    func insertNewNumber(name: String, number: String){
        if let number = Int(number) {
            //let indexpath = IndexPath(row: 5, section: 0)
            //tableView.beginUpdates()
            //tableView.insertRows(at: <#T##[IndexPath]#>, with: <#T##UITableView.RowAnimation#>)
            //tableView.endUpdates()
        //tableView.beginUpdates()
        PhoneBook.phoneBook.append(PhoneBook(name: name, number: number))
        //tableView.endUpdates()
        //tableView.reloadData()
        tableView.reloadSections([0], with: .fade)
        }
    }

}
extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Contacts"
    }
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
    /// retention cycle week self no longer keep a reference in memory
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil){[weak self]_,_,completion in
            guard let self = self else {return}
            self.handleDeleteAction(indexPath: indexPath)
            //completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
       // deleteAction.backgroundColor = .blue
        let swipAction = UISwipeActionsConfiguration(actions: [deleteAction])
        swipAction.performsFirstActionWithFullSwipe = true
        return swipAction
    }
    func handleDeleteAction(indexPath: IndexPath){
        tableView.beginUpdates()
        PhoneBook.phoneBook.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .middle)
        tableView.endUpdates()
    }
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PhoneBook.phoneBook.count
    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//
//                PhoneBook.phoneBook.remove(at: indexPath.row)
//                tableView.beginUpdates()
//                tableView.deleteRows(at: [indexPath], with: .fade)
//
//                tableView.endUpdates()
//
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstSection", for: indexPath) as! addNumberToCell
        cell.Name.text = PhoneBook.phoneBook[indexPath.row].name
        cell.PhoneNumber.text = String(PhoneBook.phoneBook[indexPath.row].number)
        return cell
    }
    
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
