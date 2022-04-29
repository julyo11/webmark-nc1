//
//  BookmarkViewController.swift
//  webmark
//
//  Created by Julyo  on 29/04/22.
//

import UIKit

class BookmarkViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

//    @IBOutlet weak var bookmarkCategory: UILabel!
//    @IBOutlet weak var bookmarkName: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items:[Bookmark]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Bookmarks"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchBookmark()
    }
    
    func fetchBookmark() {
        do {
            self.items = try! context.fetch(Bookmark.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        catch {
            
        }
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        // Alert Input Bookmart Data
        let alert = UIAlertController(title: "Add Bookmark", message: "Input bookmark detail", preferredStyle: .alert)
        alert.addTextField()
        
        let submitButton = UIAlertAction(title: "Add", style: .default) { (action) in
            let textField = alert.textFields![0]
            
            // New Bookmark Object
            let newBookmark = Bookmark(context: self.context)
            newBookmark.name = textField.text
            newBookmark.link = "dwinawan.com"
            newBookmark.category = "Website Inspiration"
            
            // Save Data
            do {
                try self.context.save()
            }
            catch {
                // Error Message
            }
            
            //Refetch data
            self.fetchBookmark()
        }
        
        alert.addAction(submitButton)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}

extension BookmarkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkCell", for: indexPath)
        let bookmark = self.items![indexPath.row]
        cell.textLabel?.text = bookmark.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bookmark = self.items![indexPath.row]
        
        let alert = UIAlertController(title: "Edit Bookmark", message: "Edit bookmark detail", preferredStyle: .alert)
        
        alert.addTextField()
        
        let textField = alert.textFields![0]
        textField.text = bookmark.name
        
        let saveButton = UIAlertAction(title: "Save", style: .default) {(action) in
            
            let textField = alert.textFields![0]
            
            bookmark.name = textField.text
            
            do {
                try self.context.save()
            }
            catch {
                // Error message
            }
            
            self.fetchBookmark()

        }
        alert.addAction(saveButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") {(action, view, completionHandler) in
            
            let bookmarkToRemove = self.items![indexPath.row]
            
            self.context.delete(bookmarkToRemove)
            
            do {
                try  self.context.save()
            }
            catch {
                // Error Message
            }
            
            self.fetchBookmark()
            
            
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}
