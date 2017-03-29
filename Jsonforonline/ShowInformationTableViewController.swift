//
//  ShowInformationTableViewController.swift
//  Jsonforonline
//
//  Created by sky on 2017/3/29.
//  Copyright © 2017年 sky. All rights reserved.
//

import UIKit

class ShowInformationTableViewController: UITableViewController {

    var dataArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f4a75ba9-7721-4363-884d-c3820b0b917c")
        let urlResquest = URLRequest(url: url!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        let task = URLSession.shared.dataTask(with: urlResquest) { (data:Data?, response: URLResponse?, err: Error?) in
            guard err == nil else{
                return
            }
            if let data = data{
                do {
                    let dic = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:AnyObject]
                    let dataArray = dic["result"]!["results"] as! [[String:AnyObject]]
                    print(dataArray)
                    self.tableView.reloadData()
                }
                catch{
                    
                }
            }
        }
        
        task.resume()

    }


    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
        //print(dataArray.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celldetail", for: indexPath)

        cell.textLabel?.text = dataArray[indexPath.row]["HairType"] as? String

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
