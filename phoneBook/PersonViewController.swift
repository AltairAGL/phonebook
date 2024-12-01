//
//  PersonViewController.swift
//  phoneBook
//
//  Created by Altair on 27.11.2024.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var namelabel: UILabel!
    
    @IBOutlet weak var surnamelabel: UILabel!
    
    @IBOutlet weak var phonelabel: UILabel!
    
    @IBOutlet weak var nametextfield: UITextField!
    
    @IBOutlet weak var surnametextfield: UITextField!
    
    @IBOutlet weak var phonetextfield: UITextField!
    
    var person = Person(name: "", surname: "", phone: "")
    
    var index = 0
    
    var arrayPerson: [Person] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nametextfield.text = person.name
        surnametextfield.text = person.surname
        phonetextfield.text = person.phone
        
        
    }
    
    
    @IBAction func editcontact(_ sender: Any) {
  
    
    
    
  
            // Убедимся, что текстовые поля не пустые
            guard
                let name = nametextfield.text, !name.isEmpty,
                let surname = surnametextfield.text, !surname.isEmpty,
                let phone = phonetextfield.text, !phone.isEmpty
            else {
                print("Одно из полей пустое")
                return
            }
            
            // Создаем объект Person с новыми данными
            let updatedPerson = Person(name: name, surname: surname, phone: phone)

            do {
                // Получаем текущие данные из UserDefaults
                if let data = UserDefaults.standard.data(forKey: "Person") {
                    var array = try JSONDecoder().decode([Person].self, from: data)
                    
                    // Проверяем, что индекс находится в пределах массива
                    if index >= 0 && index < array.count {
                        // Обновляем контакт по индексу
                        array[index] = updatedPerson
                        
                        // Сохраняем обновленный массив
                        let encodedata = try JSONEncoder().encode(array)
                        UserDefaults.standard.set(encodedata, forKey: "Person")
                    } else {
                        print("Индекс вне диапазона")
                    }
                } else {
                    print("Массив контактов отсутствует")
                }
            } catch {
                print("Ошибка кодирования: \(error)")
            }
            
            // Очищаем текстовые поля
            nametextfield.text = ""
            surnametextfield.text = ""
            phonetextfield.text = ""
        }

        
    
    
    
}
