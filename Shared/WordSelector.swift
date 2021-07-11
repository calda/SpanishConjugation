//
//  WordSelector.swift
//  SpanishConjugation
//
//  Created by Cal Stephens on 7/9/21.
//

import SwiftUI

struct WordSelector: View {
  
  @State var text: String = UserDefaults.standard.string(forKey: "input") ?? "estar"
  @State var requestResult: Result<Word, Swift.Error>?
  
  let dictionaryService = DictionaryService()
  
  var body: some View {
    TextField("Word", text: $text, onCommit: {
      UserDefaults.standard.setValue(text, forKey: "input")
      loadConjugationTable()
    })
    .padding(.bottom, 8)
    .onAppear {
      loadConjugationTable()
    }
    
    switch requestResult {
    case nil:
      ProgressView()
        .frame(minHeight: 160)
      
    case .success(let word):
      ConjugationTable(
        // TODO: Is there a more ergonomic way to `map` a binding?
        word: Binding(
          get: {
            switch requestResult {
            case .success(let boundWord):
              return boundWord
            case nil, .failure:
              // I assume this will never get called, right?
              return word
            }
          },
          set: {
            // This will never get called because it doesn't really make sense,
            // is there such a thing as a read-only binding?
            self.requestResult = .success($0)
          }))
        .fixedSize()
      
    case .failure(let error):
      Text(error.localizedDescription)
        .frame(maxWidth: 350, minHeight: 160)
    }
  }
  
  func loadConjugationTable() {
    requestResult = nil
    dictionaryService.fetchConjugations(for: text) { result in
      self.requestResult = result
    }
  }
  
}
