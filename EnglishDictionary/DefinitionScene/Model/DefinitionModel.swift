//
//  DefinitionModel.swift
//  EnglishDictionary
//
//  Created by Fernando Gomes on 08/02/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import Foundation
struct DefinitionModel: Codable {
    var type: String
    var definition: String
    var example: String
    var image_url: String?
    var emoji: String?
}
