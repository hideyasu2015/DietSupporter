//
//  DayListCell.swift
//  Dietsupporter1
//
//  Created by hideyasu on 6/5/19.
//  Copyright © 2019 Tsubasa_Sato. All rights reserved.
//

import UIKit
protocol UseSegueDelegate {
    func moveView(_ index: IndexPath)
}

class DayListCell: UITableViewCell {
    
    var index:IndexPath?
    var delegate:UseSegueDelegate?
    
    @IBOutlet weak var count: UILabel!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBAction func btn_NextPage(_ sender: Any) {
            delegate?.moveView(index!)
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
