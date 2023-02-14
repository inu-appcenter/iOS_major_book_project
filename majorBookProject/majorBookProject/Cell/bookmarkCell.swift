//
//  bookmarkCell.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/14.
//

import Foundation
import UIKit
import Then
import SnapKit

class bookmarkCell: UITableViewCell {
    
    
    static let identifier = "bookmarkCell"
    
    let title = UILabel()
    let author =  UILabel()
    lazy var bookmarkBtn = UIButton().then {
        $0.setImage(UIImage(named:"bookmark_line_big"), for: .selected)
        $0.setImage(UIImage(named:"bookmark_line_bigcheck"),for: .normal)
        $0.addTarget(self, action: #selector(didTapbookmarkBtn), for: .touchUpInside)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayouts()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    @objc func didTapbookmarkBtn() {
        bookmarkBtn.isSelected = !bookmarkBtn.isSelected
        print("tap btn")
    }
    
    
    private func setupLayouts(){
        [title,author,bookmarkBtn].forEach({self.addSubview($0)})
    }
    
    private func setupConstraints() {
        title.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(24)
        }
        
        author.snp.makeConstraints {
            $0.leading.equalTo(title)
            $0.top.equalTo(title.snp.bottom).offset(10)
        }
        
        bookmarkBtn.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalToSuperview().offset(28)
        }
    }
    
}
