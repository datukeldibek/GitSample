//
//  Model.swift
//  HW24
//
//  Created by Jarae on 30/3/23.
//

import Foundation

// MARK: - NewsData
struct NewsData: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String?
    let content: String
}
