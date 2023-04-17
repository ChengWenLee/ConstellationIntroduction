//
//  ConstellationDetailViewController.swift
//  ConstellationIntroduction
//
//  Created by Lee chanwen on 4/14/23.
//

import UIKit
import WebKit

class ConstellationDetailViewController: UIViewController {

    var constellation: Constellation
// Initial upper function and error handling
    init?(coder: NSCoder, constellation: Constellation) {
        self.constellation = constellation
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var constellationImageView: UIImageView! // Used to display constellation image
    @IBOutlet weak var constellationData: UITextView! // used to display constellation information
    @IBOutlet weak var constellationWeb: WKWebView! // used to display constellation web page
    
    override func viewDidLoad() {
        super.viewDidLoad()
// Display image and information
        constellationImageView.image = UIImage(named: constellation.symbolImageName)
        constellationData.text = "\(constellation.emoji) - \(constellation.name),\n \(constellation.birthdayRange),\n \(constellation.description)"
// Setup the attributes of title
        self.title = constellation.name
        let backgroudImage = UIImage(named: "outer_space")
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = backgroudImage
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        let webURLString = "https://taiwan-nightspot.com/"+constellation.url+"/"
        constellationWeb.load(URLRequest(url: URL(string: webURLString)!))
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
