//
//  ViewController.swift
//  shopping_list_app
//
//  Created by Mauro Mujica-Parodi on 2/14/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var shoppingListView: UILabel!
    var shoppingItems : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        shoppingItems = ""
        shoppingListView.text = ""
    }
    
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields {
            tf.resignFirstResponder()
        }
    }
    
    @IBAction func clearFieldsAction() {
        for tf in textFields {
            tf.text = ""
        }
    }

    @IBAction func newListAction(_ sender: Any) {
        shoppingItems = ""
        updateShoppingListView()
        clearFieldsAction()
        
    }
    
    func updateShoppingListView () {
        shoppingListView.text = shoppingItems
    }
    
    @IBAction func addItemAction(_ sender: UIButton) {
        var input : [Int:String] = [:]
        for tf in textFields {
            tf.resignFirstResponder()
            input[tf.tag] = tf.text ?? ""
        }
        
        if let description = input[0] {
            if let quantity = input[1] {
                if validate(input) {
                    shoppingItems = shoppingItems! + "\n\(quantity)x \(description)"
                } else {
                    let message = "Your input of \nDescription: \(description) \nQuantity: \(quantity) \nis invalid"
                    let title = "Text Input"
                    let alertController =
                        UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
                    
                    // Create the action.
                    let cancelAction =
                        UIAlertAction(title: "OK",
                                      style: .cancel,
                                      handler: nil)
                    alertController.addAction(cancelAction)
                    present(alertController,
                            animated: true,
                            completion: nil)
                }
                
            }
        }
        updateShoppingListView()
    }
    
    func validate(_ input: [Int:String]) -> Bool {
        if ((input[0] != "") && (input [1] != "")) {
            let quantityValidation = input [1]!
            let result = quantityValidation.range(of: "^[0-9]+$", options: .regularExpression) != nil
            return (result)
        }
        return false
    }
    
}

