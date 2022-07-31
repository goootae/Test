//
//  TableViewCell.swift
//  Test
//
//  Created by 구태훈 on 2022/07/12.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        // Configure the view for the selected state
    }
    

    func setVal(dic:[String:String]) {
   
        self.firstLabel.text = dic["value"]
        self.secLabel.text = dic["value"]
        self.thirdLabel.text = dic["value"]
        
    }
    
    
    
    

}
