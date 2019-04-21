//
//  CategoryTableViewCell.swift
//  MobileTest
//
//  Created by Pias on 4/21/19.
//  Copyright © 2019 Pias. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel?
    var descriptionLabel: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        self.descriptionLabel = UILabel(frame: CGRect(x: 0, y: 31, width: 100, height: 30))
        
        self.addSubview(self.titleLabel!)
        self.addSubview(self.descriptionLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
