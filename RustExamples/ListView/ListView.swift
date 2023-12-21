//
//  ListView.swift
//  RustExamples
//
//  Created by Tomislav Eric on 21.12.23.
//

import Foundation
import SwiftUI

struct ListView: View {
    
    @ObservedObject var vm: ListViewModel
    @EnvironmentObject var dependencies: Dependencies

    var body: some View {
        NavigationSplitView {
            List(vm.characters) { character in
                NavigationLink {
                    DetailView(vm: DetailViewModel(id: character.id, repository: dependencies.repository))
                } label: {
                    HStack {
                        Text("#\(character.id)")
                        Text(character.name)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Characters")
        } detail: {
            Text("Select a character")
        }
        .onAppear {
            vm.loadCharacters()
        }
    }
}
