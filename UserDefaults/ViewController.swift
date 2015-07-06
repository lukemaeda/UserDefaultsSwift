//
//  ViewController.swift
//  UserDefaults
//
//  Created by MAEDAHAJIME on 2015/07/05.
//  Copyright (c) 2015年 MAEDA HAJIME. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var teString: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 保存
    @IBAction func respondToSaveButtonClick() {
        // 生成
        let defaults = NSUserDefaults.standardUserDefaults()
        // データの作成
        let array: [NSString] = [
            "http://www.apple.com",
            "http://Yahoo.co.jp/",
            "http://iscene.jimdo.com",
        ]
        defaults.setObject(array, forKey: "Key01")
        let successful = defaults.synchronize()
        if successful {
            println("データの保存に成功しました。")
            teString.text = "データの保存に成功しました。" + "\n"
        }
    }
    
    // 読込
    @IBAction func respondToLoadButtonClick() {
        // 生成
        let defaults = NSUserDefaults.standardUserDefaults()
        if let bookmarks = defaults.arrayForKey("Key01") {
            println(bookmarks)
            
            teString.text  = nil
            
            // テキストの最後尾に文字列を追加する.
            for i in 0...2 {
                teString.text = teString.text + (bookmarks[i] as! String) + "\n"
            }
        }
    }
    
    // 削除
    @IBAction func respondToDeleteClick() {
        // 生成
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("Key01")
        println("データの削除に成功しました。")
        teString.text = "データの削除に成功しました。"
    }
}

