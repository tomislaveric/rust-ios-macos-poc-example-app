//
//  DetailView.swift
//  RustExamples
//
//  Created by Tomislav Eric on 21.12.23.
//

import Foundation
import SwiftUI

struct DetailView: View {
    @ObservedObject var vm: DetailViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(vm.title)
                .font(.title)
            Text(vm.species)
                .font(.headline)
            if let url = vm.imageUrl {
                AsyncImage(url: url)
            }
            Spacer()
        }
    }
}
