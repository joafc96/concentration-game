//
//  CardView.swift
//  concentration
//
//  Created by qbuser on 01/12/22.
//

import UIKit

class CardView: UIView {
    
    lazy var emojiLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = FontHelper.Default.extraLargeRegular

        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        configureView()
        configureSubViews()
        configureConstraints()
    }
    
    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    private func configureSubViews() {
        addSubview(emojiLabel)
    }
    
    private func configureConstraints() {
        emojiLabel.centerInSuperView()
    }
}
