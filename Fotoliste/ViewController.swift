//
//  ViewController.swift
//  Fotoliste
//
//  Created by Daniel Bonnauer on 28.01.15.
//  Copyright (c) 2015 Daniel Bonnauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var fotoListe: UITableView!
    
    var bilderUndNotiz = [BildUndNotiz]()

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bilderUndNotiz.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let einfacherZellenIdentifier = "Ein Item"
        
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(einfacherZellenIdentifier) as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: einfacherZellenIdentifier)
        }
        
        cell!.textLabel?.text = self.bilderUndNotiz[indexPath.row].text
        cell!.imageView?.image = self.bilderUndNotiz[indexPath.row].bild
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        zeigeViewControllerFürBildUndNotiz(self.bilderUndNotiz[indexPath.row])
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    @IBAction func knopfdruck(sender : AnyObject) {
        var picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let chosenImage = info[UIImagePickerControllerEditedImage] as UIImage
        let neuesBild = BildUndNotiz(bild: chosenImage, text: "")
        
        bilderUndNotiz += [neuesBild]
        self.fotoListe.reloadData()

        picker.dismissViewControllerAnimated(true, completion:
            {self.zeigeViewControllerFürBildUndNotiz(neuesBild)})
    }
    
    func zeigeViewControllerFürBildUndNotiz (bildUndNotiz: BildUndNotiz) {
        let notizEditController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("NotizEditViewControllerStory") as NotizEditViewController
      
        notizEditController.bildUndNotiz = bildUndNotiz
        notizEditController.liste = self.fotoListe
        
        self.presentViewController(notizEditController, animated: true, completion: nil)
    }
}

