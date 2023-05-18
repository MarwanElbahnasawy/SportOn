//
//  TeamPlayerTableViewCell.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import UIKit

class TeamPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerType: UILabel!
    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var playerMatchesCountLabel: UILabel!
    @IBOutlet weak var imgViewPlayer: UIImageView!
    @IBOutlet weak var oldConstraintViewBottom: NSLayoutConstraint!
    
    @IBOutlet weak var oldConstraintViewTop: NSLayoutConstraint!
    
    @IBOutlet weak var viewInsideCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgViewPlayer.layer.cornerRadius = imgViewPlayer.bounds.size.width / 2
        imgViewPlayer.layer.masksToBounds = true
    }
    
    func configure(currentPlayer: Player, sportSelected: String){
        imgViewPlayer.kf.setImage(with: URL(string: currentPlayer.player_image ?? "")) { result in
            if case .failure = result {
                if sportSelected == "football"{
                    self.imgViewPlayer.image = UIImage(named: "imageplaceholderfootballplayer")
                } else if sportSelected == "basketball"{
                    self.imgViewPlayer.image = UIImage(named: "imageplaceholderbasketballplayer")
                } else{
                    self.imgViewPlayer.image = UIImage(named: "imageplaceholderplayer")
                }
            }
        }
        
        playerNameLabel.text = currentPlayer.player_name
        
        playerType.text = currentPlayer.player_type
        
        if let _ = currentPlayer.player_number{
            playerNumberLabel.text = "Player No. \(currentPlayer.player_number!)"
            
        } else{
            playerNumberLabel.isHidden = true
            
        }
        
        if let _ = currentPlayer.player_match_played{
            playerMatchesCountLabel.text = "Matches Count: \(currentPlayer.player_match_played!)"
            
        } else{
            playerMatchesCountLabel.isHidden = true
            
        }
        
        contentView.layer.cornerRadius = 50
        contentView.layer.masksToBounds = true
         
        if UIDevice.current.userInterfaceIdiom == .pad{
            playerNameLabel.font = UIFont.systemFont(ofSize: 30)
            playerNumberLabel.font = UIFont.systemFont(ofSize: 30)
            playerMatchesCountLabel.font = UIFont.systemFont(ofSize: 30)
            playerType.font = UIFont.systemFont(ofSize: 30)
            
            oldConstraintViewBottom.constant = 20
            oldConstraintViewTop.constant = 20
            contentView.layer.cornerRadius = 75
            contentView.layer.masksToBounds = true
            
        }
        
        if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
            viewInsideCell.backgroundColor = .darkGray

            } else {
                viewInsideCell.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)

            }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            
        super.traitCollectionDidChange(previousTraitCollection)

                if self.traitCollection.userInterfaceStyle == .dark {

                    viewInsideCell.backgroundColor = .darkGray
                } else {

                    viewInsideCell.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                }
    }

}

