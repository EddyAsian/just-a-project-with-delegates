//
//  CategoriesTableViewController.swift
//  FeedFilter
//
//  Created by Eldar on 27/2/23.
//

import UIKit

extension CategoryTableViewController : CheckBoxDelegate {
    func checkBoxButtonTapped(in cell: CategoryTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let category = categories[indexPath.row]
            if selectedCategories.contains(category) {
                selectedCategories = selectedCategories.filter {
                    $0 != category }
                } else {
                    selectedCategories.append(category)
                }
            }
        print(selectedCategories)
        }
    }

class CategoryTableViewController: UITableViewController {
    
    var categories: [String] = ["IT", "Science", "Games", "Movies"]
    var selectedCategories = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: CategoryTableViewCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
        cell.configure(with: categories[indexPath.row])
        
        cell.delegate = self
        return cell
    }
}
