//
//  TableViewController.swift
//  VCOutstreamAds
//
//  Created by James Rainville on 9/12/17.
//  Copyright © 2017 ShastaRain. All rights reserved.
//

import UIKit

let textString1 = """
                    “The new wave of video advertising” is what Teads calls outstream, the game-changing ad format that’s earned overnight notoriety among big-name publishers and well-known marketers.

                    If you haven’t heard a lot about it, you’re not alone. Research released last week shows that two-thirds of brand professionals discovered outstream in the last year. In that same year, eMarketer found that 77% of agencies worldwide said the new format is going to be much more important to their clients’ futures.

                    So what’s all the fuss about?

                    What is outstream video?
                    You’ve probably seen outstream video before without realizing what you were looking at. The best description of the new ad units comes from the AppNexus team:

                    An ‘outstream’ video ad unit, also commonly referred to as ‘in-read’ or ‘native video’, is a new video advertising unit that autoplays in a large format player whenever a user navigates to it within text content (typically an article), even if the publisher doesn’t have their own video content. It’s called outstream because the video ad exists outside of online video content – also known as instream video content — where the ad plays either before (pre-roll), during (mid-roll), or after (post-roll) the publisher’s video content.

                    AppNexus
                    Here’s an example from In-View of what an outstream video ad looks like. Notice how the ad opens once a viewer scrolls down the page and then pauses once the player is almost out of view:
                  """

let textString2 = "Tell another really long story here"

struct cellInfo {
    var cellType: Int?
    var text: String?
}

class TableViewController: UITableViewController {
    var cellInfoArray = [cellInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cellInfoArray = [cellInfo(cellType: 1, text: textString1),
                         cellInfo(cellType: 2, text: nil),
                         cellInfo(cellType: 1, text: textString2)]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cellInfoArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        if (cellInfoArray[indexPath.row].cellType == 1) {
            let cell = Bundle.main.loadNibNamed("TextTableViewCell", owner: self, options: nil)?.first as! TextTableViewCell
            cell.textView.text = cellInfoArray[indexPath.row].text
            return cell
        } else {
            let cell = Bundle.main.loadNibNamed("VideoTableViewCell", owner: self, options: nil)?.first as! VideoTableViewCell
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (cellInfoArray[indexPath.row].cellType == 1) {
            return 700
        } else {
            return 300
        }
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
