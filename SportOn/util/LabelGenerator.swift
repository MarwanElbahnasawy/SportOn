//
//  TextGenerator.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 08/05/2023.
//

import UIKit

class LabelGenerator{
    static func generateLabel(text: String, frame: CGRect, color: UIColor = .systemBlue) -> UILabel{
        let label = UILabel(frame: frame)
        var size: CGFloat = 16
        if UIDevice.current.userInterfaceIdiom == .pad{
            size = 30
        }
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: size)
        label.textColor = color
        label.numberOfLines = 1
        return label
    }
}
