//
//  DownloaderViewModel.swift
//  FakeDownloader
//
//  Created by Lokesh Yadav on 5/17/19.
//  Copyright © 2019 Lokesh Yadav. All rights reserved.
//

import Foundation
import UIKit

class DownloaderViewModel {
    
    var downloaderData = [DownloaderModel]()
    var originalDownloaderData = [DownloaderModel]()
    
    func fetchData(completionHandler: @escaping (CustomError?) -> Void) {
        NetworkManager.sharedInstance.fetchData { downloaderModel, customError in
            if let downloaderModel = downloaderModel {
                self.originalDownloaderData = downloaderModel
                self.downloaderData = self.originalDownloaderData
                completionHandler(nil)
            } else {
                completionHandler(customError)
            }
        }
    }
    
    func getItem(at index: Int) -> DownloaderModel {
        return downloaderData[index]
    }
    
    func numberOfItems() -> Int {
        return downloaderData.count
    }
    
    func showDownloadingTask() {
        downloaderData = originalDownloaderData.filter{ $0.status == 0 }
    }
    
    func showUploadingTask() {
        downloaderData = originalDownloaderData.filter{ $0.status == 1 }
    }
    
    func showPausingTask() {
        downloaderData = originalDownloaderData.filter{ $0.status == 2 }
    }
    
    func showAllTask() {
        downloaderData = originalDownloaderData
    }
    
}
