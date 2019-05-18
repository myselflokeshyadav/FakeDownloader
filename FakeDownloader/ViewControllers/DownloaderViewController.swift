//
//  DownloaderViewController.swift
//  FakeDownloader
//
//  Created by Lokesh Yadav on 17/05/19.
//  Copyright © 2019 Lokesh Yadav. All rights reserved.
//

import UIKit

class DownloaderViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var downloaderViewModel: DownloaderViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloaderViewModel = DownloaderViewModel()
        setUpApi()
    }
    
    func setUpApi() {
        downloaderViewModel?.fetchData(completionHandler: { error in
            if let error = error {
                self.showGenericAlert(with: error.localizedDescription)
            } else {
                self.collectionView.reloadData()
            }
        })
    }

    @IBAction func showAllButtonTapped(_ sender: Any) {
        downloaderViewModel?.showAllTask()
        collectionView.reloadData()
    }
    
    @IBAction func showDownloadButtonTapped(_ sender: Any) {
        downloaderViewModel?.showDownloadingTask()
        collectionView.reloadData()
    }
    
    @IBAction func showUploadButtonTapped(_ sender: Any) {
        downloaderViewModel?.showUploadingTask()
        collectionView.reloadData()
    }
    
    @IBAction func showPausedButtonTapped(_ sender: Any) {
        downloaderViewModel?.showPausingTask()
        collectionView.reloadData()
    }
    
}

extension DownloaderViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "DownloaderCollectionViewHeaderView", for: indexPath)
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DownloaderCollectionViewCell", for: indexPath) as? DownloaderCollectionViewCell else { return UICollectionViewCell() }
        
        cell.downloadData = downloaderViewModel?.getItem(at: indexPath.row)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return downloaderViewModel?.numberOfItems() ?? 0
    }
    
}

extension DownloaderViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - Constant.cellLeftSpacing, height: Constant.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constant.cellTopSpacing, left: Constant.cellLeftSpacing, bottom: Constant.cellBottomSpacing, right: Constant.cellRightSpacing)
    }
}

