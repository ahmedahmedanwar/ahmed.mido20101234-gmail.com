//
//  ChannelVideosTableViewCell.swift
//  YoutubeEmbedApp
//
//  Created by Ahmed on 3/26/20.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ChannelVideosTableViewCell: UITableViewCell {

    @IBOutlet weak var channelVideosImg: UIImageView!
    
    @IBOutlet weak var channelVideosTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
