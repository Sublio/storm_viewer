//
//  ViewController.swift
//  StormViewer
//
//  Created by Denis Mordvinov on 25.04.2022.
//

import UIKit

class DMViewController: UITableViewController {

    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showRecommendApp))
        performSelector(inBackground: #selector(loadPictures), with: nil)
    }

    @objc func loadPictures() {
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures = pictures.sorted { $0 < $1 }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedPictureIndex = indexPath.row + 1
            vc.totalImageAmount = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @objc func showRecommendApp() {
        let string = "Try this cool app"
        let objectToShare = URL(string: "www.google.com")
        let sharedObjects: [AnyObject] = [objectToShare as AnyObject, string as AnyObject]
        let vc = UIActivityViewController(activityItems: sharedObjects, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        vc.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook, UIActivity.ActivityType.postToTwitter, UIActivity.ActivityType.mail]
        present(vc, animated: true)
    }

}
