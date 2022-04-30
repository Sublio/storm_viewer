//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Denis Mordvinov on 30.04.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = selectedImage {
            self.imageView.image = UIImage(named: image)
        }
    }

}
