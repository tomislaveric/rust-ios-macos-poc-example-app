//
//  ListViewModel.swift
//  RustExamples
//
//  Created by Tomislav Eric on 21.12.23.
//

import Foundation

class ListViewModel: ObservableObject {
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    @Published var characters: [Character] = []
    private let repository: Repository
    
    func loadCharacters() {
        Task { @MainActor in
            self.characters = try await repository.getCharacters(page: 1)
        }
    }
}
