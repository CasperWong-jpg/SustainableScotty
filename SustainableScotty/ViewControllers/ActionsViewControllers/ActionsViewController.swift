//
//  ActionsViewController.swift
//  SustainableScotty
//
//  Created by Sophia Lau on 9/30/21.
//

import UIKit

class ActionsViewController: UIViewController {

    @IBOutlet weak var favActionsButton: UIButton!
    @IBOutlet weak var quickActionsButton: UIButton!
    @IBOutlet weak var waterActionsbutton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var messages: [Message] = [
        Message(action: "Refill Reusable Waterbottle", logged: "Times Logged: 15"),
        Message(action: "Brought Reusable Mug", logged: "Times Logged: 10"),
        Message(action: "Compost at Schatz", logged: "Times Logged: 15")
    ]
    
//    func resizeImage(image: UIImage, scale: CGFloat) -> UIImage {
//        let newWidth = image.size.width * scale
//       let newHeight = image.size.height * scale
//        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
//        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
//       UIGraphicsEndImageContext()
//
//       return newImage
//   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.createNavBar(navigationItem)
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ActionsCell", bundle: nil), forCellReuseIdentifier: "ReusableActionCell")
        


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

extension ActionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableActionCell", for: indexPath) as! ActionsCell
        cell.actionTitle.text = messages[indexPath.row].action
        var backgroundImage = UIImage(named:"ActionTestImage")
        backgroundImage = Helper.resizeImage(image: backgroundImage!, scale: 2.0)
        cell.actionImage.image = backgroundImage
        //print(cell.actionTitle.text)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
}
    
