//
//  WordSelector.swift
//  SpanishConjugation
//
//  Created by Cal Stephens on 7/9/21.
//

import SwiftUI

struct WordSelector: View {
  
  @State var word = Word.estar
  
  // TODO: This app should support entering any word in the search bar,
  // and then look up the conjugations on SpanishDict
  let selectableWords: [Word] = [.estar, .ser, .caminar, .estudiar]
  
  var body: some View {
    Picker("", selection: $word) {
      ForEach(selectableWords, id: \.self) { option in
        Text(option.infinitive).tag(option)
      }
    }.frame(width: 150)
    
    ConjugationTable(word: $word)
  }
  
}
