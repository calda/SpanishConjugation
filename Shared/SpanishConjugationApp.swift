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
            .frame(minWidth: 512, minHeight: 200, alignment: .top)
            .fixedSize()
            .padding(16)
        }
    }
}
