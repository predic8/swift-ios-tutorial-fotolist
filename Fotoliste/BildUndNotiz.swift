//
//  BildUndNotiz.swift
//  Fotoliste
//
//  Created by Daniel Bonnauer on 28.01.15.
//  Copyright (c) 2015 Daniel Bonnauer. All rights reserved.
//

import UIKit

class BildUndNotiz: NSObject {
    
    var bild:UIImage
    var text:String
    
    init(bild: UIImage, text: String) {
        self.bild = bild
        self.text = text
    }
   
}
