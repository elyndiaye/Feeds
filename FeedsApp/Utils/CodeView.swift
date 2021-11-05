//
//  CodeView.swift
//  FeedsApp
//
//  Created by Ely Assumpcao Ndiaye on 04/11/21.
//

import Foundation

protocol CodeView{
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView{
    func setupView(){
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
