//
//  DefinitionHeaderTableViewCell.swift
//  EnglishDictionary
//
//  Created by Fernando Gomes on 09/02/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import UIKit

class DefinitionHeaderTableViewCell: UITableViewCell {
    private var wordModel: WordModel?
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var pronunciationLabel: UILabel!
    
    
    init(wordModel: WordModel) {
        super.init(style: .default, reuseIdentifier: "definitionHeaderCellt")
        self.wordModel = wordModel
        self.wordLabel.text = self.wordModel?.word
        self.pronunciationLabel.text = self.wordModel?.pronunciation
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
