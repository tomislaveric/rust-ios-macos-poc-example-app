//
//  Character.swift
//  RustExamples
//
//  Created by Tomislav Eric on 21.12.23.
//

import Foundation

public struct Character: Identifiable {
    public let id: Int
    let name: String
    let species: String
    let imageUrl: URL?
}
