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
                shoppingItems = shoppingItems! + "\n\(quantity)x \(description)"
            }
        }
        updateShoppingListView()
    }
    
}

