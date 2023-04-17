//
//  ConstellationsTableViewController.swift
//  ConstellationIntroduction
//
//  Created by Lee chanwen on 4/14/23.
//

import UIKit

class ConstellationsTableViewController: UITableViewController {
    // Build up constellations data array by GPT
    let constellations = [
        Constellation(symbolImageName: "aquarius", name: "Aquarius", description: "Independent, mysterious, free-spirited", birthdayRange: "23/Jan - 22/Feb", emoji: "♒️", url: "aqr"),
        Constellation(symbolImageName: "pisces", name: "Pisces", description: "Sensitive, imaginative, dreamy", birthdayRange: "23/Feb - 22/Mar", emoji: "♓️", url: "psc"),
        Constellation(symbolImageName: "aries", name: "Aries", description: "Confident, courageous, passionate", birthdayRange: "23/Mar - 22/Apr", emoji: "♈️", url: "ari"),
        Constellation(symbolImageName: "taurus", name: "Taurus", description: "Stable, reliable, stubborn", birthdayRange: "23/Apr - 22/May", emoji: "♉️", url: "tau"),
        Constellation(symbolImageName: "gemini", name: "Gemini", description: "Adaptable, versatile, curious", birthdayRange: "23/May - 22/Jun", emoji: "♊️", url: "gem"),
        Constellation(symbolImageName: "cancer", name: "Cancer", description: "Intuitive, nurturing, sensitive", birthdayRange: "23/Jun - 22/Jul", emoji: "♋️", url: "cnc"),
        Constellation(symbolImageName: "leo", name: "Leo", description: "Proud, creative, passionate", birthdayRange: "23/Jul - 22/Aug", emoji: "♓️", url: "leo"),
        Constellation(symbolImageName: "virgo", name: "Virgo", description: "Practical, analytical, perfectionist", birthdayRange: "23/Aug - 22/Sep", emoji: "♍️", url: "vir"),
        Constellation(symbolImageName: "libra", name: "Libra", description: "Diplomatic, charming, idealistic", birthdayRange: "23/Sep - 22/Oct", emoji: "♎️", url: "lib"),
        Constellation(symbolImageName: "scorpio", name: "Scorpio", description: "Intense, passionate, mysterious", birthdayRange: "23/Oct - 22/Nov", emoji: "♏️", url: "sco"),
        Constellation(symbolImageName: "sagittarius", name: "Sagittarius", description: "Optimistic, adventurous, free-spirited", birthdayRange: "23/Nov - 22/Dec", emoji: "♐️", url: "sgr"),
        Constellation(symbolImageName: "capricorn", name: "Capricorn", description: "Ambitious, responsible, disciplined", birthdayRange: "23/Dec - 22/Jan", emoji: "♑️", url: "cap")
    ]
    
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//  Setup backgroud image of table view controller
    let backgroundImage = UIImage(named: "outer_space")
    let backgroungImageView = UIImageView(image: backgroundImage)
        tableView.backgroundView = backgroungImageView
        tableView.backgroundView?.alpha = CGFloat(0.5)
// Setup the attributes of title
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor: UIColor.systemYellow
        ]
        self.navigationController?.navigationBar.largeTitleTextAttributes = nil
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        self.title = "CONSTELLATIONS"
        
    }

    
    
// Setup IBSegueAction to diplay next detail data page and transfer the constellation data to next page
    @IBSegueAction func showDetailData(_ coder: NSCoder) -> ConstellationDetailViewController? {
        if let row = tableView.indexPathForSelectedRow?.row {
         return ConstellationDetailViewController(coder: coder, constellation: constellations[row])
        }else{
            return nil
        }
    }
    
    
    // MARK: - Table view data source
// Table View Controller section number set to 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
// Table view controller section 1 rom nuumber set to constellations array's count
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return constellations.count
    }
// Fill in constellations array data to table view cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {// Set data source from reuse Indentifier "ConstellationList" (Select Table View Cell's Attributes Inspector to set the Identifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConstellationList", for: indexPath)
        let constellation = constellations [indexPath.row]
        // Make different background color of odd and even row
        number = indexPath.row
        if number % 2 == 0 {
            cell.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.8, alpha: 0.5)
        }else{
            cell.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 1, alpha: 0.5)
        }
        // Select emoji, name and description to fill in the row
        var content = cell.defaultContentConfiguration()
        content.text = "\(constellation.emoji) - \(constellation.name)"
        content.secondaryText = constellation.description
        cell.contentConfiguration = content

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
