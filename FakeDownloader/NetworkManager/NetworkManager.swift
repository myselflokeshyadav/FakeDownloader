//
//  NetworkManager.swift
//  FakeDownloader
//
//  Created by Lokesh Yadav on 5/17/19.
//  Copyright © 2019 Lokesh Yadav. All rights reserved.
//

import Foundation
import Alamofire

enum CustomError: Error {
    
    case incorrectUrl
    case fetchError
    case parseError
    
    var localizedDescription: String {
        switch self {
        case .incorrectUrl:
            return "Incorrect URL"
        case .fetchError:
            return "Error in fetching data"
        case .parseError:
            return "Error in parsing the data"
        }
    }
}

class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    
    func fetchData(completionHandler: @escaping ([DownloaderModel]?, CustomError?) -> Void) {
        var downloaderData = [DownloaderModel]()
        let request = Alamofire.request(Constant.apiURLString)
        request.responseJSON { response in
            switch response.result {
            case .success(let json):
                guard let json = json as? [[String: Any]] else { return completionHandler(nil, CustomError.parseError) }
                for item in json {
                    downloaderData.append(self.updateDownloaderInfo(json: item))
                }
                completionHandler(downloaderData, nil)
            case .failure:
                completionHandler(nil, CustomError.fetchError)
            }
        }
    }
    
    func updateDownloaderInfo(json: [String: Any]) -> DownloaderModel {
        var downloader = DownloaderModel()
        downloader.movie_title = json["movie_title"] as? String
        downloader.movie_year = json["movie_year"] as? String
        downloader.downloaded_size = json["downloaded_size"] as? Double
        downloader.current_number_of_seeds = json["current_number_of_seeds"] as? Int
        downloader.total_number_of_seeds = json["total_number_of_seeds"] as? Int
        downloader.current_number_of_peers = json["current_number_of_peers"] as? Int
        downloader.total_number_peers = json["total_number_peers"] as? Int
        downloader.download_speed = json["download_speed"] as? String
        downloader.upload_speed = json["upload_speed"] as? String
        downloader.uploaded_size = json["uploaded_size"] as? String
        downloader.added_date_time = json["added_date_time"] as? String
        downloader.upload_status = json["upload_status"] as? String
        downloader.status = json["status"] as? Int
        
        return downloader
    }
    
}
