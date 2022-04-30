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
    var selectedPictureIndex: Int?
    var totalImageAmount: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .systemBackground
        if let image = selectedImage {
            self.imageView.image = UIImage(named: image)
        }
        title = "Picture \(selectedPictureIndex ?? 0) out of \(totalImageAmount ?? 0)"
        navigationItem.largeTitleDisplayMode = .never
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
