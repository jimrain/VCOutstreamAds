//
//  VideoTableViewCell.swift
//  VCOutstreamAds
//
//  Created by James Rainville on 9/12/17.
//  Copyright © 2017 ShastaRain. All rights reserved.
//

import UIKit

let kViewControllerPlaybackServicePolicyKey = "BCpkADawqM3dCmAPU7-jl0hHWW8097dehsjhdHYeCZVO3HbClNSwbtBpZkhuDuab141BnGkFL_xvPCif9v6Sz5A27pFUo8-qFuq42J6vzrXnLkmeLzGkQ1HzNdow2rI0qmhyPaEEhSGTPpW9"
let kViewControllerAccountID = "4517911906001"
let kViewControllerVideoID = "5269117590001"

class VideoTableViewCell: UITableViewCell, BCOVPlaybackControllerDelegate {
    let playbackService = BCOVPlaybackService(accountId: kViewControllerAccountID, policyKey: kViewControllerPlaybackServicePolicyKey)
    let playbackController :BCOVPlaybackController
    
    @IBOutlet weak var VideoContainer: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        let manager = BCOVPlayerSDKManager.shared();
        playbackController = (manager?.createPlaybackController(viewStrategy: nil))!
        
        super.init(coder: aDecoder)
        
        playbackController.delegate = self
        playbackController.isAutoAdvance = true
        playbackController.isAutoPlay = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let controlView = BCOVPUIBasicControlView.withVODLayout()
        let playerView = BCOVPUIPlayerView(playbackController: self.playbackController, options: nil, controlsView: controlView)
        playerView?.frame = self.VideoContainer.bounds
        playerView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.VideoContainer.addSubview(playerView!)
        playerView?.playbackController = playbackController
        
        requestContentFromPlaybackService()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func requestContentFromPlaybackService()
    {
        playbackService?.findVideo(withVideoID: kViewControllerVideoID, parameters: nil) { (video: BCOVVideo?, jsonResponse: [AnyHashable: Any]?, error: Error?) -> Void in
            
            if let v = video
            {
                self.playbackController.setVideos([v] as NSArray)
            }
            else
            {
                print("ViewController Debug - Error retrieving video: \(error?.localizedDescription ?? "unknown error")")
            }
        }
    }

    
    
    
}
