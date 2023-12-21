//
//  Dependencies.swift
//  RustExamples
//
//  Created by Tomislav Eric on 21.12.23.
//

import Foundation

class Dependencies: ObservableObject {
    let repository: Repository = RepositoryImpl()
}
