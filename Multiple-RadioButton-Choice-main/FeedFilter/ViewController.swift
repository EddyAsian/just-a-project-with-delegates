//
//  ViewController.swift
//  FeedFilter
//
//  Created by Алексей Поддубный on 08.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedCategories = [String]()
    var categoriesString: String = ""

    @IBOutlet weak var selectedCategoriesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindFromCategoriesToMain(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? CategoryTableViewController {
            categoriesString = ""
            selectedCategories = sourceVC.selectedCategories
            for category in selectedCategories {
                categoriesString.append("\(category), ")
            }
            if categoriesString.count > 1 {
                categoriesString.removeLast(2)
            }
            selectedCategoriesLabel.text = categoriesString
        }
    }


}

