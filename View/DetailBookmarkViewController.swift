//
//  DetailBookmarkViewController.swift
//  webmark
//
//  Created by Julyo  on 29/04/22.
//

import UIKit

class DetailBookmarkViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items:[Bookmark]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        // New Bookmark Object
        let newBookmark = Bookmark(context: self.context)
        newBookmark.name = nameTextField.text
        newBookmark.link = linkTextField.text
        newBookmark.category = categoryTextField.text
        
        // Save Data
        do {
            try self.context.save()
        }
        catch {
            // Error Message
        }
        
        //Refetch data
//        self.fetchBookmark()
        
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
