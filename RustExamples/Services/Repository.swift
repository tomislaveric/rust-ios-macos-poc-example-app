//
//  Repository.swift
//  RustExamples
//
//  Created by Tomislav Eric on 21.12.23.
//

import Foundation
import RustMultiPlatform

protocol Repository {
    func getCharacter(id: Int) async throws -> Character
    func getCharacters(page: Int) async throws -> [Character]
}

public struct RepositoryImpl: Repository {
    private let repo = RustMultiPlatform.Repository()
    
    public func getCharacter(id: Int) async throws -> Character {
        try await repo.getCharacter(id: UInt8(id)).toModel()
    }

    public func getCharacters(page: Int) async throws -> [Character] {
        let characters = try await repo.getCharacters(page: UInt8(page))
        return characters.map { $0.toModel() }
    }
}

extension RustMultiPlatform.Character {
    func toModel() -> Character {
        Character(
            id: Int(self.id()),
            name: self.name(),
            species: self.species(),
            imageUrl: URL(string: self.image())
        )
    }
}
