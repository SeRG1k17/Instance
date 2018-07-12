//
//  ViewController.swift
//  Instance
//
//  Created by SeRG1k17 on 07/12/2018.
//  Copyright (c) 2018 SeRG1k17. All rights reserved.
//

import UIKit
import Instance

class ViewController: UIViewController {
    
    lazy var someView: SomeView  = {
        let some = SomeView.instance()
        view.addSubview(some)
        return some
    }()
    
    lazy var anotherView: AnotherView = {
        //let another = AnotherView.instance(from: SomeView.self)
        let another = AnotherView.instance(from: MyXibs.someView)
        view.addSubview(another)
        return another
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        someView.frame = CGRect(x: 16,
                                y: view.bounds.size.height - 16 - 64,
                                width: view.bounds.size.width - 32,
                                height: 64)
        
        anotherView.frame = CGRect(x: someView.frame.origin.x + 16,
                                   y: someView.frame.origin.y - 16 - 32,
                                   width: view.bounds.size.width - 64,
                                   height: 32)
    }

    
    //MARK: - Actions
    
    @IBAction func secondVCDidTapped(_ sender: UIButton) {
        
        let vc = SecondViewController.instance(from: MyStoryboard.second)
        //let vc = SecondViewController.instance(from: "Wrong")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func customVCDidTapped(_ sender: UIButton) {
        
        //CustomTableViewCell.register(in tableView)
        
        //MyStoryboard.name("Custom").instance(of: CustomViewController.self)
        let vc = CustomViewController.instance(from: MyStoryboard.name("Custom"))
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func inCurrentVCDidTapped(_ sender: UIButton) {
        
        let vc = instance(of: InCurrentSbViewController.self)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func sameNamesDidTapped(_ sender: UIButton) {
        
        let vc = MyTableViewController.instance()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func xibDidTapped(_ sender: UIButton) {
        
        //let vc = XibViewController.xibInstance(from: "XibViewController")
        let vc = XibViewController.xibInstance()
        //let vc = XibViewController.instance(from: MyControllers.inCurrentSb)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func collectionDidTapped(_ sender: UIButton) {
        
        let vc = CollectionViewController.xibInstance()
        navigationController?.pushViewController(vc, animated: true)
    }

}
