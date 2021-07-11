//
//  ContentView.swift
//  Shared
//
//  Created by Cal Stephens on 7/8/21.
//

import SwiftUI

struct ConjugationTable: View {
  
  @Binding var word: Word
  
  var body: some View {
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
    
    LazyHGrid(
      rows: .init(repeating: GridItem(.fixed(10)), count: 6),
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
            .frame(width: 70, height: 10, alignment: .trailing)
        }
        
        ForEach(word.allTenses, id: \.self) { tense in
          Text(tense.tense)
            .font(.headline)
            .frame(alignment: .leading)
            // Is it possible to have these columns dynamically? I hear this is hard
            .frame(width: 100, height: 10, alignment: .leading)
          
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
              .frame(width: 105, height: 10, alignment: .leading)
              // TODO: Make this color less abrasive?
              .foregroundColor((conjugatedForm.isIrregular) ? .red : .primary)
          }
        }
      }).padding(
        EdgeInsets(
          top: 8,
          leading: 16,
          bottom: 8,
          trailing: 16))
  }
}

