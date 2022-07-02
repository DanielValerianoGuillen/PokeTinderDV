//
//  Model.swift
//  iOSAppTemplate
//
//  Created by Linder Anderson Hassinger Solano    on 5/06/22.
//

struct Pokemon: Codable {
     let count: Int?
     let next: String?
     let results: [Result]
 }

 struct Result: Codable {
     let name: String
     let url: String
 }
