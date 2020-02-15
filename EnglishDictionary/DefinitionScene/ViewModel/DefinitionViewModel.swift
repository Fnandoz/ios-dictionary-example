//
//  DefinitionViewModel.swift
//  EnglishDictionary
//
//  Created by Fernando Gomes on 08/02/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import Foundation
protocol DefinitionViewModelProtocol {
    func convertJson(data: [String: Any], completion: @escaping (WordModel) -> ())
    func returnDefinition(at index: Int) -> DefinitionModel
    func returnWordModel() -> WordModel
    func returnDefinitions() -> [DefinitionModel]
    func countDefinitions() -> Int
    func showDefinition(at index: Int)
}

class DefinitionViewModel: DefinitionViewModelProtocol {
    var wordModel: WordModel?
    
    init(data: [String : Any]) {
        
        self.convertJson(data: data) { (wordModel) in
            self.wordModel = wordModel
        }
    }
    
    func convertJson(data: [String : Any], completion: @escaping (WordModel) -> ()) {
        do {
            let decoded = try JSONSerialization.data(withJSONObject: data, options: [])
            let word = try JSONDecoder().decode(WordModel.self, from: decoded)
            completion(word)
        } catch {
            print("erro \(error)")
        }
    }
    
    func returnDefinition(at index: Int) -> DefinitionModel {
        return (wordModel?.definitions![index])!
    }
    
    func returnWordModel() -> WordModel {
        return wordModel!
    }
    
    func returnDefinitions() -> [DefinitionModel] {
        return wordModel!.definitions!
    }
    
    func countDefinitions() -> Int {
        return wordModel?.definitions?.count ?? 0
    }
    
    func showDefinition(at index: Int) {
        let definition = self.returnDefinition(at: index)
        
    }
}
