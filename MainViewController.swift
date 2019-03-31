//
//  MainViewController.swift
//  卖机票
//
//  Created by 方瑾 on 2019/2/26.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var airportTableView: UITableView!
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        airportTableView.delegate = self
        airportTableView.dataSource = self
        
    }
}
extension MainViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    
}

