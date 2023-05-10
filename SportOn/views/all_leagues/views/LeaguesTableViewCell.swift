//
//  LeaguesTableViewCell.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var leagueLabel: UILabel!
    
    @IBOutlet weak var oldConstraintLabelLeft: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
        imgView.layer.cornerRadius = imgView.bounds.size.width / 2
    }
    
    func configure(currentLeauge: AllLeaguesItem){
        leagueLabel.text = currentLeauge.league_name
        
        imgView.kf.setImage(with: URL(string: currentLeauge.league_logo ?? "")) { result in
            if case .failure = result {
                self.imgView.image = UIImage(named: "leagueplaceholder")
            }
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad{
        
            leagueLabel.font = UIFont.systemFont(ofSize: 35)
            
            oldConstraintLabelLeft.constant = 50
            
        }
    }

}
