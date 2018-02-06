//
//  FeedController.swift
//  GreenyEarth
//
//  Created by Ajith Panneerselvam on 06/02/18.
//  Copyright © 2018 Team United. All rights reserved.
//

import UIKit

class FeedController: UICollectionViewController {
    
    var posts: [Post] = Post.fetchPosts()
    
    struct Identifier{
        static let newsFeedCell = "NewsFeedCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        self.navigationItem.title = "Plant Feed"
        
        collectionView?.register(NewsfeedCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.newsFeedCell)
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.newsFeedCell, for: indexPath) as! NewsfeedCollectionViewCell
        cell.post = self.posts[indexPath.item]
        return cell
    }
}

extension FeedController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }
}

