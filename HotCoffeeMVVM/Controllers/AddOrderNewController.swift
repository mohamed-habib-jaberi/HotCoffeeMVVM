//
//  AddOrderNewController.swift
//  HotCoffeeMVVM
//
//  Created by mohamed  habib on 20/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit

class AddOrderNewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    private var vm = AddCoffeeOrderViewModel()
    
    private var coffeeSizeSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.tableView.delegate = self
        //        self.tableView.dataSource = self
        
        setupUI()
    }
    
    //MARK: Add SegmentedControl Progmatically
    
    private func setupUI(){
        self.coffeeSizeSegmentedControl = UISegmentedControl(items: self.vm.sizes)
        self.coffeeSizeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.coffeeSizeSegmentedControl)
        self.coffeeSizeSegmentedControl.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 20).isActive = true
        self.coffeeSizeSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    //MARK: UITableViewDataSource, UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier:
            "CoffeeTypeTableViewCell", for: indexPath)
        
        cell.textLabel?.text = self.vm.types[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
           print("Row \(indexPath.row) selected")
       }
       func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
           print("Row \(indexPath.row) selected")
       }
    
}
