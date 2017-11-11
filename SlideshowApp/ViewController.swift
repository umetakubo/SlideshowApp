//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 梅津卓人 on 2017/10/22.
//  Copyright © 2017年 takuto.umedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MEMO:
    // - コードの並びは、変数 > メソッドのように並べておくのがオススメです
    //   - メソッドとメソッドの間は１行程度空けておきましょう
    //   - さらに同じような役割の変数・メソッドをまとめておくと読みやすくなります
    //
    // - インデントが崩れてきたら、command + a でコードを全選択して、control + i でインデントを整えられます
    
    @IBOutlet weak var imageView: UIImageView!
    
    //func imageViewTapped(_ sender: UITapGestureRecognizer) {
        //print("タップ")
    //}
    
    //画像変数
    var imageArray = [UIImage]()
    //
    var imageNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = [UIImage(named: "IMG_0504.jpg")!, UIImage(named: "IMG_0508.jpg")!, UIImage(named: "IMG_0517.jpg")!]
        imageView.image = imageArray[imageNumber]
    
        //タップ定義
        let tap = UITapGestureRecognizer(target:self, action: #selector(didClickImageView))
            
        //imageViewにタップの登録
        self.imageView.addGestureRecognizer(tap)
       
    }
    
    //タップを検知する関数
    func didClickImageView(recognizer: UIGestureRecognizer) {
        performSegue(withIdentifier: "zoom", sender: nil)
        //if let imageView = recognizer.view as? UIImageView {
            //let image = imageView.image
            // 次のUIViewControllerのインスタンス
            //let nextViewController =  ZoomViewController.image = image
        }
    //遷移の関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueから遷移先のZoomViewControllerを取得する
        let nextViewController:ZoomViewController = segue.destination as! ZoomViewController
        let image = imageView.image
        //遷移先にimageという変数を渡した
        nextViewController.image = image!
        }
        
        // MEMO:
        // - viewDidLoad()はViewControllerの初期化後に１度呼ばれます
        // - ここではタイマーはまだ必要ないので作らないでおきます
        
        // タイマーを設定
        //timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.onTimer(timer:)), userInfo: nil, repeats: true)
        //imageView.image = images[0]
                // Do any additional setup after loading the view, typically from a nib.
    
        //進むボタン
    @IBAction func nextButton(_ sender: Any) {
        
        
        imageNumber += 1
        // MEMO:
        // imageNumberがimageArrayの配列のインデックス内に収まるよう値を整えます
        if imageArray.count - 1 < imageNumber {
            imageNumber = 0
        }
        imageView.image = imageArray[imageNumber]
        
               }
    //ボタン無効化の関数
    //func setButtonEnabled(nextInactive: Bool, backInactive: Bool){
        //nextInactive.isEnabled = false
        //backInactive.isEnabled = false
    //}
    
    @IBOutlet weak var nextInactive: UIButton!
    @IBOutlet weak var backInactive: UIButton!
    
    //戻るボタン
    @IBAction func backButton(_ sender: Any) {
        
        //-1で大丈夫？？
        imageNumber -= 1
        
        if imageNumber < 0 {
            imageNumber = imageArray.count - 1
        }
        imageView.image = imageArray[imageNumber]
        
        }
    
    /// Timerによって、一定の間隔で呼び出される関数
    func onTimer(timer: Timer) {
        
        imageView.image = imageArray[imageNumber]
        imageNumber += 1
        if imageArray.count - 1 < imageNumber {
            imageNumber = 0
        }
        // 関数が呼ばれていることを確認
        //print("onTimer")
    }
    /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
      //再生停止ボタン
    @IBAction func startResetButton(_ sender: Any) {
        //nextInactive.isEnabled = true
        //backInactive.isEnabled = true
        //事前にタイマーを初期化する変数設定が必要？？
        //imageView.imageとTimerを結びつける？？
        
        imageView.image = imageArray[0]
        
        // MEMO:
        // - Timerはボタンが押された時に作成すればOKです
        
        if timer == nil {
            nextInactive.isEnabled = false
            backInactive.isEnabled = false
            timer = Timer.scheduledTimer(timeInterval: 2.0,
                                         target: self,
                                         selector: #selector(ViewController.onTimer(timer:)),
                                         userInfo: nil,
                                         repeats: true)
        }
        else {
            timer?.invalidate()
            timer = nil
            nextInactive.isEnabled = true
            backInactive.isEnabled = true
        }
        // タイマー実行の設定
        //timer = Timer.scheduledTimer(timeInterval: 2.0,
                                     //target: self,
                                     //selector: #selector(ViewController.onTimer(timer:)),
                                     //userInfo: nil,
                                     //repeats: true)
        //nextButton: false, backButton: false
         //if timer == nil {
            //nextInactive.isEnabled = true
            //backInactive.isEnabled = true
        
        //Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

    
}



