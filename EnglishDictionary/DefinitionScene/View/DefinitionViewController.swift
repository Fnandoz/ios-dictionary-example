//
//  DefinitionViewController.swift
//  EnglishDictionary
//
//  Created by Fernando Gomes on 09/02/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    private var definitionViewModel: DefinitionViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    init(definitionVM: DefinitionViewModel) {
        super.init(nibName: "DefinitionViewController", bundle: nil)
        self.definitionViewModel = definitionVM
    }

    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.register(UITableView.self, forCellReuseIdentifier: "definitionHeaderCell")
//        self.tableView.register(UITableView.self, forCellReuseIdentifier: "definitionCell")
        self.tableView.register(UINib(nibName: "DefinitionHeaderTableViewCell", bundle: self.nibBundle), forCellReuseIdentifier: "definitionHeaderCell")
        self.tableView.register(UINib(nibName: "DefinitionTableViewCell", bundle: self.nibBundle), forCellReuseIdentifier: "definitionCell")
        self.tableView.reloadData()

    }

}

extension DefinitionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 76
        }
        return 126
    }
}

extension DefinitionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.definitionViewModel?.countDefinitions() ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && indexPath.section == 0 {
            let headerCell = self.tableView.dequeueReusableCell(withIdentifier: "definitionHeaderCell", for: indexPath) as? DefinitionHeaderTableViewCell
            let word = self.definitionViewModel?.returnWordModel()
            headerCell?.wordLabel.text = word?.word
            headerCell?.pronunciationLabel.text = word?.pronunciation
            return headerCell!
        }
        let definition = self.definitionViewModel?.returnDefinition(at: indexPath.row)
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "definitionCell", for: indexPath) as? DefinitionTableViewCell
        cell?.typeLabel.text = definition?.type
        cell?.definitionLabel.text = definition?.definition
        cell?.exampleLabel.text = definition?.example
        return cell!
    }
}
