//
//  CategoryTableViewCell.swift
//  FeedFilter
//
//  Created by Алексей Поддубный on 08.02.2022.
//

import UIKit

protocol CheckBoxDelegate: AnyObject {
    func checkBoxButtonTapped(in cell: CategoryTableViewCell)
}

class CategoryTableViewCell: UITableViewCell {
    
    static let identifier = "CategoryTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CategoryTableViewCell", bundle: nil)
    }
    
    weak var delegate: CheckBoxDelegate?
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var checkBoxButton: CheckBox!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBoxButton.setTitle("", for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with category: String) {
        categoryNameLabel.text = category
    }
    
    @IBAction func checkBoxTapped(_ sender: Any) {
        delegate?.checkBoxButtonTapped(in: self)
    }
    
}
