//
//  feedCollectionViewCell.swift
//  GreenyEarth
//
//  Created by Ajith Panneerselvam on 06/02/18.
//  Copyright © 2018 Team United. All rights reserved.
//

import UIKit

class NewsfeedCollectionViewCell: UICollectionViewCell
{
    // MARK: - Model
    
    var post: Post! {
        didSet {
            guard let username = post.createdBy.username,
                let profileImage = post.createdBy.profileImage,
                let caption = post.caption,
                let postImage = post.image,
                let numberOfLikes = post.numberOfLikes,
                let numberOfComments = post.numberOfComments,
                let numberOfShares = post.numberOfShares else {
                    return
            }
            
            // set the values to our UI elements
            usernameLabel.text = username
            profileImageView.image = profileImage
            
            captionTextView.text = caption
            postImageView.image = postImage
            
            let likeStat = (numberOfLikes == 0) ? "" : "\(numberOfLikes) Likes     "
            let commentStat = (numberOfComments == 0) ? "" : "\(numberOfComments) Comments     "
            let shareStat = (numberOfShares == 0) ? "" : "\(numberOfShares) Shares"
            postStatLabel.text = likeStat + commentStat + shareStat
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private lazy var profileImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "ajit")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel! = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Ajith Panneerselvam"
        return label
    }()
    
    private lazy var captionTextView: UITextView! = {
        let textView = UITextView()
        
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        textView.text = "This is an example of what a text status will look like with a photo."
        
        return textView
    }()
    
    private lazy var postImageView: UIImageView! = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "magic_night_city_1x")
        
        return imageView
    }()
    
    private lazy var postStatLabel: UILabel! = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = .darkGray
        label.text = "12 Likes     8 Comments    2 Shares"
        
        return label
    }()
    
    private lazy var postDividerView: UIView! = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 226/255.0, green: 228/255.0, blue: 232/255.0, alpha: 1.0)
        return view
    }()
    
    private lazy var timeAgoLabel: UILabel! = {
        let label = UILabel()
        label.text = "Now "
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    private lazy var privacyImageView: UIImageView! = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "globe_small")
        
        return imageView
    }()
    
    private lazy var likeButton: UIButton! = NewsfeedCollectionViewCell.buttonWithTitle("Like", imageName: "like")
    private lazy var commentButton: UIButton! = NewsfeedCollectionViewCell.buttonWithTitle("Comment", imageName: "comment")
    private lazy var shareButton: UIButton! = NewsfeedCollectionViewCell.buttonWithTitle("Share", imageName: "share")
    
    private class func buttonWithTitle(_ title: String, imageName: String) -> UIButton
    {
        let button = UIButton()
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(red: 143/255.0, green: 150/255.0, blue: 163/255.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
        
        return button
    }
    
    func setupUI()
    {
        self.backgroundColor = .white
        
        // Add UI elements as subviews to the cell
        addSubview(usernameLabel)
        addSubview(profileImageView)
        addSubview(captionTextView)
        addSubview(postImageView)
        addSubview(postStatLabel)
        addSubview(postDividerView)
        addSubview(likeButton)
        addSubview(shareButton)
        addSubview(commentButton)
        addSubview(privacyImageView)
        addSubview(timeAgoLabel)
        
        // profileImageView and usernameLabel auto layout constraints
        addConstraints(withVisualFormat: "H:|-8-[v0(44)]-8-[v1]-8-|", views: profileImageView, usernameLabel)
        addConstraints(withVisualFormat: "V:|-12-[v0]", views: usernameLabel)
        addConstraints(withVisualFormat: "V:|-12-[v0(44)]-4-|", views: profileImageView)
        
        // constraints for timeAgoLabel + privacyImageView
        addConstraints(withVisualFormat: "H:[v0]-8-[v1]-4-[v2(10)]", views: profileImageView, timeAgoLabel, privacyImageView)
        addConstraints(withVisualFormat: "V:[v0]-4-[v1]", views: usernameLabel, timeAgoLabel)
        addConstraints(withVisualFormat: "V:[v0]-6-[v1(10)]", views: usernameLabel, privacyImageView)
        
        // constraints for captionTextView
        addConstraints(withVisualFormat: "H:|-8-[v0]-8-|", views: captionTextView)
        
        // constraints for postImageView
        addConstraints(withVisualFormat: "H:|[v0]|", views: postImageView)
        
        // postStat label
        addConstraints(withVisualFormat: "H:|-8-[v0]-8-|", views: postStatLabel)
        
        // contraints for postDividerView
        addConstraints(withVisualFormat: "H:|-8-[v0]-8-|", views: postDividerView)
        
        // constraints for buttons
        addConstraints(withVisualFormat: "H:|[v0(v2)][v1(v2)][v2]|", views: likeButton, commentButton, shareButton)
        addConstraints(withVisualFormat: "V:[v0(44)]|", views: commentButton)
        addConstraints(withVisualFormat: "V:[v0(44)]|", views: shareButton)
        addConstraints(withVisualFormat: "V:[v0(44)]|", views: likeButton)
        
        // constraints
        addConstraints(withVisualFormat: "V:|-12-[v0(44)]-8-[v1]-8-[v2(215)]-8-[v3(24)]-8-[v4(0.4)][v5(44)]|", views: profileImageView, captionTextView, postImageView, postStatLabel, postDividerView, likeButton)
    }
}

private extension UIView
{
    func addConstraints(withVisualFormat format: String, views: UIView...)
    {
        var viewsDictionary = [String : UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary)
        addConstraints(constraints)
    }
}




