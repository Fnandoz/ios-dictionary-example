//
//  SearchViewModelMock.swift
//  EnglishDictionaryTests
//
//  Created by Fernando Gomes on 16/02/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import Foundation
@testable import EnglishDictionary

class SearchViewModelMock: SearchViewModelProtocol {
    func searchWord(searchModel: SearchModel, completion: @escaping ([String : Any], NSError?) -> Void) {
        
    }
    
    func showDefinition(definition: [String : Any]) {
        
    }
    
    
    
}
