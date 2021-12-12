//
//  ContentView.swift
//  Shared
//
//  Created by Cal Stephens on 7/8/21.
//

import SwiftUI

struct ConjugationTable: View {
  
  let tenses: [KeyPath<Word, ConjugatedTense>]
  @Binding var word: Word
  
  var body: some View {    
    LazyHGrid(
      rows: .init(repeating: GridItem(.fixed(12), alignment: .leading), count: 6),
      content: {
        
        let rowNames = [
          "",
          "yo",
          "nosotros",
          "tú",
          "él/ella/usted",
          "ellos/ustedes"
        ]
        
        ForEach(rowNames, id: \.self) { formName in
          Text(formName)
            .font(.subheadline)
            .foregroundColor(.secondary)
            .frame(alignment: .trailing)
        }
        
        ForEach(tenses, id: \.self) { tenseKeypath in
          let tense = word[keyPath: tenseKeypath]
          
          Text(tense.tense)
            .font(.headline)
            .padding(.horizontal, 4)
          
          let formsToDisplay = [
            tense.firstPersonSingular,
            tense.firstPersonPlural,
            tense.secondPersonSingular,
            tense.thirdPersonSingular,
            tense.thirdPersonPlural,
          ]
          
          // Each item in the `LazyHGrid` has to have a unique ID,
          // so we combine the tense name and index into a composite ID value
          //  - We also mix in the word itself, so the cell refreshes when the state changes.
          let conjugatedForms = formsToDisplay.enumerated().map { (index, conjugatedForm) in
            (id: "\(word.infinitive)-\(tense.tense)-\(index)", value: conjugatedForm)
          }
          
          ForEach(conjugatedForms, id: \.id) { (_, conjugatedForm) in
            Text(conjugatedForm.text)
              .foregroundColor((conjugatedForm.isIrregular) ? .red : .primary)
              .padding(.horizontal, 4)
              // TODO: Use `.textSelection(.enabled)` when compiled with Xcode 13 SDK
          }
        }
      }).padding(
        EdgeInsets(
          top: 10,
          leading: 16,
          bottom: 10,
          trailing: 16))
  }
}

