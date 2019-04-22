//
//  ResourceTableViewCell.swift
//  MobileTest
//
//  Created by Pias on 4/21/19.
//  Copyright © 2019 Pias. All rights reserved.
//

import UIKit

class ResourceTableViewCell: UITableViewCell {
    
    var resourceImageView: UIImageView?
    var title: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.resourceImageView = UIImageView(frame: CGRect(x: 10, y: 0, width: 50, height: 50))
        self.title = UILabel(frame: CGRect(x: 60, y: 0, width: self.frame.size.width - 60, height: 30))
        self.title?.textAlignment = .right
        
        self.addSubview(self.resourceImageView!)
        self.addSubview(self.title!)
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
