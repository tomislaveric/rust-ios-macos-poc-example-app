//
//  DetailViewModel.swift
//  RustExamples
//
//  Created by Tomislav Eric on 21.12.23.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published var character: Character?
    
    init(id: Int?, repository: Repository) {
        guard let id else { return }
        Task { @MainActor in
            self.character = try await repository.getCharacter(id: id)
        }
    }
    
    var title: String {
        character?.name ?? ""
    }
    
    var species: String {
        character?.species ?? ""
    }
    
    var imageUrl: URL? {
        character?.imageUrl
    }
}
