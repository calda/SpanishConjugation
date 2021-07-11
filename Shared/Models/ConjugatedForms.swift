//
//  ConjugatedForms.swift
//  SpanishConjugation
//
//  Created by Cal Stephens on 7/8/21.
//

/// A single conjugated form of a word
struct ConjugatedForm: Hashable {
  let text: String
  let isIrregular: Bool
}

/// Fully conjugated forms of word in a certain verb tense
struct ConjugatedTense: Hashable {
  let tense: String
  let firstPersonSingular: ConjugatedForm
  let firstPersonPlural: ConjugatedForm
  let secondPersonSingular: ConjugatedForm
  let secondPersonPlural: ConjugatedForm
  let thirdPersonSingular: ConjugatedForm
  let thirdPersonPlural: ConjugatedForm
  
  var allCases: [ConjugatedForm] {
    [
      firstPersonSingular,
      firstPersonPlural,
      secondPersonSingular,
      secondPersonPlural,
      thirdPersonSingular,
      thirdPersonPlural,
    ]
  }
}
