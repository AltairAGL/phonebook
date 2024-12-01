//
//  ViewController.swift
//  phoneBook
//
//  Created by Altair on 14.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var namelabel: UILabel!
    
    @IBOutlet weak var surnamelabel: UILabel!
    
    @IBOutlet weak var phonelabel: UILabel!
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var surenametextfield: UITextField!
    
    @IBOutlet weak var phonetextfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addContact(_ sender: Any) {
        
        let person = Person(name: textField.text!, surname: surenametextfield.text!, phone: phonetextfield.text!)
        
        do {
            
            if let data = UserDefaults.standard.data(forKey: "Person") {
                
                var array = try JSONDecoder().decode([Person].self, from: data)
                
                array.append(person)
                
                let encodedata = try JSONEncoder().encode(array)
                
                UserDefaults.standard.set(encodedata, forKey: "Person")
                
            } else {
                let encodedata = try JSONEncoder().encode([person])
                
                UserDefaults.standard.set(encodedata, forKey: "Person")
            }
            
        } catch {
            
            print("unable to encode\(error)")
        }
        
        
        textField.text = ""
        surenametextfield.text = ""
        phonetextfield.text = ""
        
        
        
                
            }
        }
        
        
        
        
/*        if let phoneBookArray = UserDefaults.standard.array(forKey: "phoneBookArray") as? [String] {
           
            var array = phoneBookArray
            array.append(contact)
            
            UserDefaults.standard.setValue(array, forKey: "phoneBookArray")
            
        } else {
            UserDefaults.standard.setValue([contact], forKey: "phoneBookArray")
        }
        
        textField.text = ""
 
 */
        


