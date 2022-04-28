//
//  ViewController.swift
//  webmark
//
//  Created by Julyo  on 29/04/22.
//

import UIKit

class OnboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "Bookmark") as! BookmarkViewController
        viewController.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

