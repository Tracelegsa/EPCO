//
//  CommunityViewController.swift
//  EPCO
//
//  Created by 문정호 on 2022/07/02.
//

import UIKit

class CommunityViewController: UIViewController {
    @IBOutlet weak var communityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    @IBAction func backWardButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helper

    private func setupCollectionView() {
        // delegate 연결
        communityCollectionView.delegate = self
        communityCollectionView.dataSource = self
        
        // cell 등록
        communityCollectionView.register(
            UINib(nibName: "SearchCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        
        communityCollectionView.register(
            UINib(nibName: "RankCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier:  RankCollectionViewCell.identifier)
        
        communityCollectionView.register(
            UINib(nibName: "GerneCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier:  GerneCollectionViewCell.identifier)

    
    }


    // MARK: - Navigation

}

// MARK: - UICollectionViewDelegate,UICollectionViewDataSource

extension CommunityViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    //section 안의 아이템 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 6
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        
        switch section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else {
                fatalError("셀 캐스팅 실패...")
            }
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankCollectionViewCell.identifier, for: indexPath) as? RankCollectionViewCell else {
                fatalError("셀 캐스팅 실패...")
            }
            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GerneCollectionViewCell.identifier, for: indexPath) as? GerneCollectionViewCell else {
                fatalError("셀 캐스팅 실패...")
            }
            return cell
        }
    }
}


//MARK: - UICollectionViewDelegateFlowLayout

extension CommunityViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = indexPath.section
        
        switch section{
            
        case 0:
            return CGSize(width: collectionView.frame.width, height: CGFloat(100))
        case 1:
            return CGSize(width: collectionView.frame.width, height: CGFloat(100))
        default:
            return CGSize(width: collectionView.frame.width/2 - 5, height: CGFloat(200))
            
        }
    }
    
    // item간 Spacing(열간 간격)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 2:
            return CGFloat(1)
        default:
            return CGFloat(0)
        }
    }
    
    // line간 Spacing(행간 간격)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 2:
            return CGFloat(10)
        default:
            return CGFloat(0)
        }
    }
}
