//
//  ConjugationEngine.swift
//  SpanishConjugation
//
//  Created by Cal Stephens on 7/8/21.
//

enum ConjugationEngine {
  
  static func conjugate(
    infinitive: String,
    applying baseSuffix: String,
    using form: ConjugationForm)
    -> ConjugatedForm
  {
    switch form {
    case .irregular(let irregularForm):
      return ConjugatedForm(text: irregularForm, isIrregular: true)
      
    case ._unsupportedRegularForm(let regularForm):
      return ConjugatedForm(text: regularForm, isIrregular: false)
      
    case .regular:
      // The "engine" currently only supports -ar form words (lol)
      let suffix = "ar"
      guard infinitive.hasSuffix(suffix) else {
        return ConjugatedForm(text: "(unsupported)", isIrregular: false)
      }
      
      var conjugatedWord = infinitive
      conjugatedWord.removeLast(2)
      conjugatedWord.append(baseSuffix)
      return ConjugatedForm(text: conjugatedWord, isIrregular: false)
    }
  }
  
}
