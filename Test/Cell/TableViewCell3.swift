//
//  TableViewCell3.swift
//  Test
//
//  Created by 구태훈 on 2022/08/04.
//

import UIKit

class TableViewCell3: UITableViewCell {

    @IBOutlet weak var temp1: UILabel!
    @IBOutlet weak var temp2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setVal(apiResponse:ApiResponse) {
   
        self.temp1.text = apiResponse.curNm
        self.temp2.text = apiResponse.curUnit
        
    }
}
