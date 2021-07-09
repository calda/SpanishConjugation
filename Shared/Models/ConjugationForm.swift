//
//  ConjugatedForm.swift
//  SpanishConjugation
//
//  Created by Cal Stephens on 7/8/21.
//

/// The conjugated form of an individual word
enum ConjugationForm {
  /// This word follows regular conjugation patterns in this case
  case regular
  /// The word has an irregular form in this case
  case irregular(String)
  /// The word has a regular form that is not supported by the "conjugation engine"
  case _unsupportedRegularForm(String)
}

/// A conjugation forms of word in a certain verb tense
struct ConjugationForms: Conjugated {
  let firstPersonSingular: ConjugationForm
  let firstPersonPlural: ConjugationForm
  let secondPersonSingular: ConjugationForm
  let secondPersonPlural: ConjugationForm
  let thirdPersonSingular: ConjugationForm
  let thirdPersonPlural: ConjugationForm
}

extension ConjugationForms {
  static let regular = ConjugationForms(
    firstPersonSingular: .regular,
    firstPersonPlural: .regular,
    secondPersonSingular: .regular,
    secondPersonPlural: .regular,
    thirdPersonSingular: .regular,
    thirdPersonPlural: .regular)
}
