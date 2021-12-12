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
        .frame(minHeight: 300)
      
    case .success(let word):
      HStack(alignment: .firstTextBaseline, spacing: 8) {
        Text(word.infinitive)
          .font(.title2)
          .bold()
        
        if let translation = word.translation {
          Text(translation)
            .font(.title3)
            .foregroundColor(.secondary)
        }
      }
      
      let wordBinding = Binding(
        get: {
          switch requestResult {
          case .success(let boundWord):
            return boundWord
          case nil, .failure:
            return word
          }
        },
        set: { (_: Word) in fatalError("Unsupported") })
      
      ConjugationTable(
        tenses: [\.present, \.preterite, \.pastImperfect, \.future, \.conditional],
        word: wordBinding)
        .fixedSize()
      
      ConjugationTable(
        tenses: [\.imperative, \.subjunctivePresent, \.subjunctiveImperfect, \.subjunctiveFuture],
        word: wordBinding)
        .fixedSize()
      
    case .failure(let error):
      Text({ () -> String in
        var string = ""
        dump(error, to: &string)
        return string
      }())
        .frame(maxWidth: 350, minHeight: 300)
    }
  }
  
  func loadConjugationTable() {
    requestResult = nil
    dictionaryService.fetchConjugations(for: text) { result in
      self.requestResult = result
    }
  }
  
}
