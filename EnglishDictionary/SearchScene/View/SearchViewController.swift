//
//  SearchViewController.swift
//  EnglishDictionary
//
//  Created by Fernando Gomes on 08/02/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    private var searchViewModel: SearchViewModel?
    @IBOutlet weak var searchTextField: UITextField!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(searchVM: SearchViewModel) {
        super.init(nibName: "SearchViewController", bundle: nil)
        self.searchViewModel = searchVM
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchAction(_ sender: Any) {
        guard let text = searchTextField.text else { return }
        if !text.isEmpty {
            let searchModel = SearchModel(word: text)
            searchViewModel?.searchWord(searchModel: searchModel, completion: { (response, error) in
                if error != nil {
                    DispatchQueue.main.sync {
                        let definitionVM = DefinitionViewModel(data: response)
                        let definitionVC = DefinitionViewController(definitionVM: definitionVM)
                        self.present(definitionVC, animated: true, completion: nil)
                    }
                } else {
                    print(error?.code)
                }
            })
        }
    }
    
}
