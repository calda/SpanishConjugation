//
//  SpanishConjugationApp.swift
//  Shared
//
//  Created by Cal Stephens on 7/8/21.
//

import SwiftUI

@main
struct SpanishConjugationApp: App {
    var body: some Scene {
        WindowGroup {
          WordSelector()
            .frame(minWidth: 625, minHeight: 200, alignment: .top)
            .padding(16)
        }
    }
}
