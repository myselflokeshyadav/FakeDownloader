//
//  DownloaderModel.swift
//  FakeDownloader
//
//  Created by Lokesh Yadav on 5/17/19.
//  Copyright © 2019 Lokesh Yadav. All rights reserved.
//

import Foundation

struct DownloaderModel {
    
    var movie_title: String?
    var movie_year: String?
    var downloaded_size: Double?
    var current_number_of_seeds: Int?
    var total_number_of_seeds: Int?
    var current_number_of_peers: Int?
    var total_number_peers: Int?
    var download_speed: String?
    var upload_speed: String?
    var uploaded_size: String?
    var added_date_time: String?
    var upload_status: String?
    var status: Int?
    
}
