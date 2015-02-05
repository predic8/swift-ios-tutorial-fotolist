//
//  NotizEditViewController.swift
//  Fotoliste
//
//  Created by Daniel Bonnauer on 28.01.15.
//  Copyright (c) 2015 Daniel Bonnauer. All rights reserved.
//

import UIKit

class NotizEditViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var bildAnzeige: UIImageView!

    @IBOutlet weak var textFeld: UITextField!
    
    @IBOutlet weak var fertigBtn: UIButton!
    @IBOutlet weak var abbrechenBtn: UIButton!
    
    var bildUndNotiz: BildUndNotiz?
    var liste: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFeld.delegate = self
        
        textFeld.text = bildUndNotiz?.text
        bildAnzeige.image = bildUndNotiz?.bild
        
        let berührungsdetektor = UITapGestureRecognizer(target: self, action: "schießeTastatur")
        self.view.addGestureRecognizer(berührungsdetektor)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func knopfdruck(sender: AnyObject) {
        var knopf = sender as UIButton
        if fertigBtn == knopf {
            if !textFeld.text.isEmpty {
                if (bildUndNotiz != nil) {
                    bildUndNotiz!.text = textFeld.text
                    liste?.reloadData()
                }
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                var alarm = UIAlertView()
                alarm.title = "Fehler"
                alarm.message = "Die Notiz darf nicht leer sein"
                alarm.addButtonWithTitle("Ok")
                alarm.show()
            }
        } else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textFeld.resignFirstResponder()
        return true
    }
    
    func schließeTastatur(){
        textFeld.resignFirstResponder()
    }
}
