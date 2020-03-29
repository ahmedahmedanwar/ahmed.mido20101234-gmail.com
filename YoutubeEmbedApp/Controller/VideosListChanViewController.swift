//
//  VideosListChanViewController.swift
//  YoutubeEmbedApp
//
//  Created by Ahmed on 3/29/20.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class VideosListChanViewController: UIViewController {

    @IBOutlet weak var videoListTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        videoListTable.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
