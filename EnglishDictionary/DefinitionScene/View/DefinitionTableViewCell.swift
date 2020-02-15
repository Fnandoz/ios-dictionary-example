//
//  DefinitionTableViewCell.swift
//  EnglishDictionary
//
//  Created by Fernando Gomes on 09/02/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import UIKit

class DefinitionTableViewCell: UITableViewCell {
    private var definitionModel: DefinitionModel?
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    
    init(definitionModel: DefinitionModel) {
        super.init(style: .default, reuseIdentifier: "DefinitionCell")
        self.definitionModel = definitionModel
        self.typeLabel.text = self.definitionModel?.type
        self.definitionLabel.text = self.definitionModel?.definition
        self.exampleLabel.text = self.definitionModel?.example
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
