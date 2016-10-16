//
//  ColorTableViewController.swift
//  AC3.2Unit2FinalAssessment
//
//  Created by Erica Y Stevens on 10/6/16.
//  Copyright © 2016 Erica Stevens. All rights reserved.
//

import UIKit

class ColorTableViewController: UITableViewController {

    var crayons: [Crayon] = []
    
    let cellIdentifier = "crayonCell"
    let crayonSegueIdentifier = "showColorSegue"

    override func viewDidLoad() {
        super.viewDidLoad()

        for c in crayolaColors {
            //Initialized with the extra credit init
            if let crayon = Crayon(dict: c) {
                crayons.append(crayon)
            }
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return crayons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        
        //https://code.tutsplus.com/tutorials/ios-from-scratch-with-swift-table-view-basics--cms-25160
        let color = crayons[indexPath.row]
    
         //Configure the cell...
        cell.textLabel?.text = color.name
        cell.backgroundColor = UIColor(colorLiteralRed: Float(color.red), green: Float(color.green), blue: Float(color.blue), alpha: 1)
        
        if color.name == "Black" {
            cell.textLabel?.textColor = UIColor.white
        }

        return cell
    }
 


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //https://www.codebeaulieu.com/29/prepareForSegue
        if segue.identifier == crayonSegueIdentifier {
            if let destination = segue.destination as? CrayonViewController {
                let path = tableView.indexPathForSelectedRow
                let cell = tableView.cellForRow(at: path!)
                destination.viaSegue = (cell?.textLabel?.text!)!
                let color = crayons[(path?.row)!]
                destination.view.backgroundColor = UIColor(colorLiteralRed: Float(color.red), green: Float(color.green), blue: Float(color.blue), alpha: 1.0)
                destination.colorName.text = color.name
                if color.name == "Black" {
                    destination.colorName.textColor = UIColor.white
                }
            }
        }
    }
    

}
