//
//  TableViewController.swift
//  phoneBook
//
//  Created by Altair on 20.11.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayPerson:[Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        do {
            if let data = UserDefaults.standard.data(forKey: "Person") {
                
                let array = try JSONDecoder().decode([Person].self, from: data)
                
                arrayPerson = array
                
                tableView.reloadData()
            }
        } catch {
            print("unable to encode \(error)")
        }
    }
    
    
    func saveContact() {
        
        do {
            let data = try JSONEncoder().encode(arrayPerson)
            UserDefaults.standard.set(data, forKey: "Person")
        } catch {
            print("unable to encode \(error)")
        }
    }
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPerson.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = arrayPerson[indexPath.row].name + " " + arrayPerson[indexPath.row].surname
        
        cell.detailTextLabel?.text = arrayPerson[indexPath.row].phone
        

        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        /*   guard indexPath.row < arrayPerson.count else {
                print("Ошибка: индекс \(indexPath.row) выходит за пределы массива \(arrayPerson.count)")
                return
            }
            
            guard let vc = storyboard?.instantiateViewController(identifier: "PersonViewController") as? PersonViewController else {
                print("Ошибка: не удалось найти PersonViewController")
                return
            }

            vc.index = indexPath.row
            vc.person = arrayPerson[indexPath.row]
            vc.arrayPerson = arrayPerson

            navigationController?.show(vc, sender: true)
        */
        
      let vc = storyboard?.instantiateViewController(identifier: "PersonViewController") as! PersonViewController
        
        vc.index = indexPath.row
        vc.person = arrayPerson[indexPath.row]
        vc.arrayPerson = arrayPerson
        
                
        navigationController?.show(vc, sender: true)
        
       
        
        
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Delete the row from the data source
            
            arrayPerson.remove(at: indexPath.row)
            
            saveContact()
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
