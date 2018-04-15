//
//  FirstViewController.swift
//  GestureRecognizerDemo
//
//  Created by Patrick Roskam on 4/13/18.
//  Copyright © 2018 PatrickMRoskam. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var squareView: UIView!

    override func viewDidLoad() {
        
        squareView = UIView(frame: CGRect(x: 150, y: 250, width: 100, height: 100))
        squareView.backgroundColor = .blue
        view.addSubview(squareView)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(recognizer:)))
        let pinchGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePinch(recognizer:)))
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        let screenEdgePanGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleScreenEdgePan(recognizer:)))
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(recognizer:)))
        
        squareView.gestureRecognizers = [panGesture, tapGesture, rotateGesture, pinchGesture, swipeGesture, screenEdgePanGesture, longPressGesture]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        let translationInView = recognizer.translation(in: self.view)
        recognizer.view!.center = CGPoint(x:view.center.x + translationInView.x, y:view.center.y + translationInView.y)
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        recognizer.view?.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    @objc func handleRotation(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    @objc func handlePinch(recognizer : UIPinchGestureRecognizer) {
        
        let pinchLabel: UILabel = UILabel()
        pinchLabel.frame = CGRect(x: 50, y: 150, width: 200, height: 21)
        pinchLabel.backgroundColor = UIColor.orange
        pinchLabel.textColor = UIColor.black
        pinchLabel.textAlignment = NSTextAlignment.center
        pinchLabel.text = "Dude! You Pinched Me!"
        self.view.addSubview(pinchLabel)
        
    }
    
    @objc func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        
        let swipeLabel: UILabel = UILabel()
        swipeLabel.frame = CGRect(x: 50, y: 150, width: 200, height: 21)
        swipeLabel.backgroundColor = UIColor.orange
        swipeLabel.textColor = UIColor.black
        swipeLabel.textAlignment = NSTextAlignment.center
        swipeLabel.text = "Dude! You Swiped Me!"
        self.view.addSubview(swipeLabel)
        
    }
    
    @objc func handleScreenEdgePan(recognizer: UIScreenEdgePanGestureRecognizer) {
        
        print ("screen edge pan has been recognized")
        
    }
    
    @objc func handleLongPress(recognizer: UILongPressGestureRecognizer) {
        
        print ("long press has been recognized")
        
    }
}

