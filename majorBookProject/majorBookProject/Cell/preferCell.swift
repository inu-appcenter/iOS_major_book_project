//
//  preferenceTableViewCell.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/13.
//

import UIKit

class preferCell: UITableViewCell {
    
    static let identifier = "preferCell"
    let preferText = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayouts()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    private func setupLayouts(){
        self.addSubview(preferText)
    }
    
    private func setupConstraints(){
        preferText.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.top.equalToSuperview().offset(18)
            
        }
    }
}
