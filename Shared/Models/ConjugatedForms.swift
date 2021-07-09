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
struct ConjugatedTense: Conjugated, Hashable {
  
  let tense: String
  let firstPersonSingular: ConjugatedForm
  let firstPersonPlural: ConjugatedForm
  let secondPersonSingular: ConjugatedForm
  let secondPersonPlural: ConjugatedForm
  let thirdPersonSingular: ConjugatedForm
  let thirdPersonPlural: ConjugatedForm
  
  init(
    infinitive: String,
    applying baseConjugation: BaseConjugation,
    using forms: ConjugationForms)
  {
    let conjugate = { (_ baseSuffix: String, _ form: ConjugationForm) -> ConjugatedForm in
      ConjugationEngine.conjugate(
        infinitive: infinitive,
        applying: baseSuffix,
        using: form)
    }
    
    self.tense = baseConjugation.name
    self.firstPersonSingular = conjugate(baseConjugation.firstPersonSingular, forms.firstPersonSingular)
    self.firstPersonPlural = conjugate(baseConjugation.firstPersonPlural, forms.firstPersonPlural)
    self.secondPersonSingular = conjugate(baseConjugation.secondPersonSingular, forms.secondPersonSingular)
    self.secondPersonPlural = conjugate(baseConjugation.secondPersonPlural, forms.secondPersonPlural)
    self.thirdPersonSingular = conjugate(baseConjugation.thirdPersonSingular, forms.thirdPersonSingular)
    self.thirdPersonPlural = conjugate(baseConjugation.thirdPersonPlural, forms.thirdPersonPlural)
  }
}
