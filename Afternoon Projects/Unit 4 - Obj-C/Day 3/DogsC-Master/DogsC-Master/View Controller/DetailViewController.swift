//
//  DetailViewController.swift
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/25/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    
    var dogImage: UIImage?{
        didSet{
           dogImageView.image = dogImage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
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
