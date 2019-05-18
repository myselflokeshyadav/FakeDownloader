//
//  DownloaderCollectionViewCell.swift
//  FakeDownloader
//
//  Created by Lokesh Yadav on 5/17/19.
//  Copyright © 2019 Lokesh Yadav. All rights reserved.
//

import UIKit

class DownloaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var downloaderImageView: UIImageView?
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var sizeLabel: UILabel?
    @IBOutlet var peerLabel: UILabel?
    @IBOutlet var seedsLabel: UILabel?
    @IBOutlet var downloadSpeedLabel: UILabel?
    @IBOutlet var uploadSpeedLabel: UILabel?
    @IBOutlet var uploadLabel: UILabel?
    @IBOutlet var addedLabel: UILabel?
    @IBOutlet var statusLabel: UILabel?
    @IBOutlet var dividerImageView: UIImageView?
    
    var downloadData: DownloaderModel? {
        didSet {
            setUpCell(downloaderModel: downloadData)
        }
    }
    
    func setUpCell(downloaderModel: DownloaderModel?) {
        switch downloaderModel?.status {
        case 0:
            downloaderImageView?.image = UIImage(named: "download1")
            dividerImageView?.image = UIImage(named: "greenDivider")
        case 1:
            downloaderImageView?.image = UIImage(named: "upload1")
            dividerImageView?.image = UIImage(named: "redDivider")
        case 2:
            downloaderImageView?.image = UIImage(named: "pause1")
            dividerImageView?.image = UIImage(named: "yellowDivider")
        case .none:
            break
        case .some(_):
            break
        }
        
        nameLabel?.text = "\(downloaderModel?.movie_title ?? "") (\(downloaderModel?.movie_year ?? ""))"
        sizeLabel?.text = "\(downloaderModel?.downloaded_size ?? 0) GB"
        seedsLabel?.text = "\(downloaderModel?.current_number_of_seeds ?? 0) of \(downloaderModel?.total_number_of_seeds ?? 0)"
        peerLabel?.text = "\(downloaderModel?.current_number_of_peers ?? 0) of \(downloaderModel?.total_number_peers ?? 0)"
        downloadSpeedLabel?.text = downloaderModel?.download_speed
        uploadSpeedLabel?.text = downloaderModel?.upload_speed
        uploadLabel?.text = downloaderModel?.uploaded_size
        addedLabel?.text = downloaderModel?.added_date_time
        statusLabel?.text = downloaderModel?.upload_status
    }
        
}
