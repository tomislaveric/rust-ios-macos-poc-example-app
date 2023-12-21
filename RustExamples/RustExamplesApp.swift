//
//  RustExamplesApp.swift
//  RustExamples
//
//  Created by Tomislav Eric on 20.12.23.
//

import SwiftUI

@main
struct RustExamplesApp: App {
    private let dependencies = Dependencies()
    
    var body: some Scene {
        WindowGroup {
            ListView(vm: ListViewModel(repository: dependencies.repository))
        }.environmentObject(dependencies)
    }
}
