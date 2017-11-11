//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 梅津卓人 on 2017/10/28.
//  Copyright © 2017年 takuto.umedu. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    
    var image = UIImage()
    
    @IBAction func backButton(_ sender: Any) {
    //@IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var imageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageArray = [UIImage(named: "IMG_0504.jpg")!, UIImage(named: "IMG_0508.jpg")!, UIImage(named: "IMG_0517.jpg")!]
        imageView2.image = image
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
