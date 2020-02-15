//
//  WordModel.swift
//  EnglishDictionary
//
//  Created by Fernando Gomes on 08/02/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import Foundation
struct WordModel: Codable {
    var definitions: [DefinitionModel]?
    var word: String?
    var pronunciation: String?
}
