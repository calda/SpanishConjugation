//
//  Word.swift
//  SpanishConjugation
//
//  Created by Cal Stephens on 7/8/21.
//

/// A conjugated Spanish word
struct Word: Hashable {
  let infinitive: String
  let translation: String?
  
  /// The present tense -- "I walk" / "I am walking"
  let present: ConjugatedTense
  
  /// The preterite tense -- "I walked"
  let preterite: ConjugatedTense
  
  /// The past imperfect tense -- "I was walking" / "I used to walk"
  let pastImperfect: ConjugatedTense
  
  /// The future tense -- "I will walk"
  let future: ConjugatedTense
  
  /// The conditional tense -- "I would walk"
  let conditional: ConjugatedTense
  
  /// The affermative imperative tense -- "Walk."
  let imperative: ConjugatedTense
  
  /// The present subjective tense -- "that I walk"
  let subjunctivePresent: ConjugatedTense
  
  /// The imperfect subjective tense
  let subjunctiveImperfect: ConjugatedTense
  
  /// The future subjective tense
  let subjunctiveFuture: ConjugatedTense
}
