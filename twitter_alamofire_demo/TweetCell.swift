//
//  TweetCell.swift
//  
//
//  Created by Joakim Jorde on 10/6/18.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {

    @IBOutlet weak var profilePictureImage: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileUsernameLabel: UILabel!
    @IBOutlet weak var tweetDateLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var tweetRetweetLabel: UILabel!
    @IBOutlet weak var tweetFavorLabel: UILabel!
    
    var tweet: Tweet!{
        didSet{
            refreshData()
        }
    }

    @IBAction func onFavorite(_ sender: Any) {
        //Update the local tweet model
        tweet.favorited = true
        tweet.favoriteCount! += 1
        // TODO: Update cell UI
        refreshData()
        // TODO: Send a POST request to the POST favorites/create endpoint
    }
    
    func refreshData(){
        tweetTextLabel.text = tweet.text
        profileNameLabel.text = tweet.user?.name
        let user = tweet.user?.screenName!
        profileUsernameLabel.text = "@\(user ?? "Anon")"
        tweetDateLabel.text = tweet.createdAtString
        tweetRetweetLabel.text = String(tweet.retweetCount!)
        tweetFavorLabel.text = String(tweet.favoriteCount!)
        
        
        profilePictureImage.af_setImage(withURL: tweet.user!.profileImage!)
    }
    
    @IBAction func onRetweet(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
