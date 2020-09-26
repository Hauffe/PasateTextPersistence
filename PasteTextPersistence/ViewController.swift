//
//  ViewController.swift
//  PasteTextPersistence
//
//  Created by Alex on 26/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    let DATA_KEY = "data_key"
    
    var pastedStriongs: [String] = []

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let loadedStrings = UserDefaults.standard.stringArray(forKey: DATA_KEY){
            pastedStriongs.append(contentsOf: loadedStrings)
        }
        showText()
    }
    
    func addText(){
        guard let text = UIPasteboard.general.string, !pastedStriongs.contains(text) else{
            return
        }
        pastedStriongs.append(text)
        UserDefaults.standard.set(pastedStriongs, forKey: DATA_KEY)
        showText()
    }
    
    func showText(){
        textView.text = ""
        for str in pastedStriongs{
            textView.text.append("\(str)\n\n")
        }
    }
    
    @IBAction func trashPressed(_ sender: Any) {
        textView.text = ""
        pastedStriongs.removeAll()
        UserDefaults.standard.removeObject(forKey: DATA_KEY)
    }
}

