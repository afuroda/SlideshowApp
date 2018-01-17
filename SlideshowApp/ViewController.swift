//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 山口航輝 on 2018/01/13.
//  Copyright © 2018年 koki.yamaguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var imageButton: UIButton!
    
    @IBOutlet weak var startOutlet: UIButton!
    
    @IBOutlet weak var goButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    //timer用の要素
    var timer_sec:Double=0
    var timer:Timer!
    
    
    //表示する画像
    let Image1: UIImage = UIImage(named: "woman.png")!
    let Image2=UIImage(named:"men.png")!
    let Image3=UIImage(named:"women2.png")!
    
    var ImageArray = [UIImage]()
    
    //画像表示するための変数
    var count=0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        

        imageButton.setImage(Image1, for: .normal)
        //画像を配列に追加
        ImageArray.append(Image1)
        ImageArray.append(Image2)
        ImageArray.append(Image3)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segueから遷移先の情報を取得
        let secondViewController:SecondViewController=segue.destination as! SecondViewController
        
        //timerの停止
        self.timer.invalidate()
        
        
        //遷移先に送る変数の決定
        if imageButton.image(for: .normal)==ImageArray[0]{
            secondViewController.tag=0
        }else if imageButton.image(for: .normal)==ImageArray[1]{
            secondViewController.tag=1
        }else if imageButton.image(for: .normal)==ImageArray[2]{
            secondViewController.tag=2
        }
        
        //ラベルを再生に変える
        if startOutlet.currentTitle=="停止"{
            startOutlet.setTitle("再生", for: .normal)
            
            //戻る:進むボタンを有効
            goButton.isEnabled=true
            backButton.isEnabled=true
            
        }
        
        
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //進むボタンの動作
    @IBAction func go(_ sender: Any) {
        count+=1
        
      
        
        if count>=3{
            count=0
        }
        
         imageChange()
        
    }
    
    
    //戻るボタンの動作
    @IBAction func back(_ sender: Any) {
        count-=1
       
        
        if count <= -1{
            count=2
        }
        
         imageChange()
      
    }
    
    
    //戻りのsegue
    @IBAction func viewBack(_ segue:UIStoryboardSegue){
        
    }
    
    //再生/停止ボタンの動作
    @IBAction func startButton(_ sender: Any) {
        if startOutlet.currentTitle=="再生"{
            startOutlet.setTitle("停止", for: .normal)//ラベルを停止に変える
            
            //戻る:進むボタンを無効化
            goButton.isEnabled=false
            backButton.isEnabled=false
            
            
            //timer_secに元の表示している画像の数字を追加
            timer_sec+=count
            
            
            //timerを作動
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            

        }else if startOutlet.currentTitle=="停止"{
            startOutlet.setTitle("再生", for: .normal)//ラベルを再生に変える
           
            //戻る:進むボタンを有効
            goButton.isEnabled=true
            backButton.isEnabled=true
            
            
            self.timer.invalidate()   // 現在のタイマーを破棄する

        }
    }
    
    
    //画像切り替え(進む：戻るボタン用)
    func imageChange(){
        if count==0{
            imageButton.setImage(ImageArray[0], for: .normal)
        }else if count==1{
            imageButton.setImage(ImageArray[1], for: .normal)
        }else if count==2{
            imageButton.setImage(ImageArray[2], for: .normal)
        }
    }
    
    
    //timer用関数
    @objc func updateTimer(timer: Timer) {
        self.timer_sec += 0.5
        
        if timer_sec>=2.5{
            timer_sec = -0.5
         }
        
        
        print(timer_sec)

        imageChangeDouble()
    }
    
    
    //画像切り替え(再生：停止ボタン用)
    func imageChangeDouble(){
        if timer_sec==0{
            imageButton.setImage(ImageArray[0], for: .normal)
        }else if timer_sec==1{
            imageButton.setImage(ImageArray[1], for: .normal)
        }else if timer_sec==2{
            imageButton.setImage(ImageArray[2], for: .normal)
        }
    }
    
    
}

