//
//  SearchViewModel.swift
//  EnglishDictionary
//
//  Created by Fernando Gomes on 08/02/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import Foundation

protocol SearchViewModelProtocol {
    func searchWord(searchModel: SearchModel, completion: @escaping ([String: Any], NSError?) -> Void)
    func showDefinition(definition: [String: Any])
}

class SearchViewModel: SearchViewModelProtocol {
    func searchWord(searchModel: SearchModel, completion: @escaping ([String: Any], NSError?) -> Void) {
        let url = URL(string: "https://owlbot.info/api/v4/dictionary/\(searchModel.word)")
        var fail: NSError? = nil
        var success: [String: Any]?
        
        var request = URLRequest(url: url!)
        request.addValue("Token f95ba2b2e035519d6ce737d859afb923195e88fa", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if error != nil {
                fail = NSError(domain: "", code: 0, userInfo: nil)
                completion([:], fail!)
            }
           
            guard let data = data else { return }
            do {
                success = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                completion(success!, NSError())
            } catch {
               print("error")
            }
        }
        task.resume()
        
    }
    
    func showDefinition(definition: [String : Any]) {
        // push view controller
        // pass, as parameter, the definition json to view controller init
        let definitionVM = DefinitionViewModel(data: definition)
        let definitionVC = DefinitionViewController(definitionVM: definitionVM)
        
    }
    
    
}
