//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 山口航輝 on 2018/01/15.
//  Copyright © 2018年 koki.yamaguchi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    //画像表示用の変数
    var tag=0
    
    //表示する画像
    let Image1: UIImage = UIImage(named: "woman.png")!
    let Image2=UIImage(named:"men.png")!
    let Image3=UIImage(named:"women2.png")!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if tag==0{
            imageView.image=Image1
        }else if tag==1{
            imageView.image=Image2
        }else if tag==2{
            imageView.image=Image3
        }
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
