//
//  Word.swift
//  SpanishConjugation
//
//  Created by Cal Stephens on 7/8/21.
//

/// A conjugated Spanish word
struct Word: Hashable {
  let infinitive: String
  let present: ConjugatedTense
  let preterite: ConjugatedTense
  let pastImperfect: ConjugatedTense
  let future: ConjugatedTense
  let conditional: ConjugatedTense
  
  var allTenses: [ConjugatedTense] {
    [present, preterite, pastImperfect, future, conditional]
  }
  
  init(
    infinitive: String,
    present presentForms: ConjugationForms,
    preterite preteriteForms: ConjugationForms,
    pastImperfect pastImperfectForms: ConjugationForms,
    future futureForms: ConjugationForms,
    conditional conditionalForms: ConjugationForms)
  {
    self.infinitive = infinitive
    present = .init(infinitive: infinitive, applying: .present, using: presentForms)
    preterite = .init(infinitive: infinitive, applying: .preterite, using: preteriteForms)
    pastImperfect = .init(infinitive: infinitive, applying: .pastImperfect, using: pastImperfectForms)
    future = .init(infinitive: infinitive, applying: .future, using: futureForms)
    conditional = .init(infinitive: infinitive, applying: .conditional, using: conditionalForms)
  }
}

extension Word {
  /// Initializes a word that is regular in all forms
  static func regular(infinitive: String) -> Word {
    Word(
      infinitive: infinitive,
      present: .regular,
      preterite: .regular,
      pastImperfect: .regular,
      future: .regular,
      conditional: .regular)
  }
}

extension Word {
  
  static let caminar = Word.regular(infinitive: "caminar")
  
  static let estudiar = Word.regular(infinitive: "estudiar")
  
  static let estar = Word(
    infinitive: "estar",
    present: .init(
      firstPersonSingular: .irregular("estoy"),
      firstPersonPlural: .regular,
      secondPersonSingular: .irregular("estás"),
      secondPersonPlural: .irregular("están"),
      thirdPersonSingular: .irregular("está"),
      thirdPersonPlural: .irregular("están")),
    preterite: .init(
      firstPersonSingular: .irregular("estuve"),
      firstPersonPlural: .irregular("estuvimos"),
      secondPersonSingular: .irregular("estuviste"),
      secondPersonPlural: .irregular("estuvieron"),
      thirdPersonSingular: .irregular("estuvo"),
      thirdPersonPlural: .irregular("estuvieron")),
    pastImperfect: .regular,
    future: .regular,
    conditional: .regular)
  
  static let ser = Word(
    infinitive: "ser",
    present: .init(
      firstPersonSingular: .irregular("soy"),
      firstPersonPlural: .irregular("somos"),
      secondPersonSingular: .irregular("eres"),
      secondPersonPlural: .irregular("son"),
      thirdPersonSingular: .irregular("es"),
      thirdPersonPlural: .irregular("son")),
    preterite: .init(
      firstPersonSingular: .irregular("fui"),
      firstPersonPlural: .irregular("fuimos"),
      secondPersonSingular: .irregular("fuiste"),
      secondPersonPlural: .irregular("fueron"),
      thirdPersonSingular: .irregular("fue"),
      thirdPersonPlural: .irregular("fueron")),
    pastImperfect: .init(
      firstPersonSingular: .irregular("era"),
      firstPersonPlural: .irregular("éramos"),
      secondPersonSingular: .irregular("eras"),
      secondPersonPlural: .irregular("eran"),
      thirdPersonSingular: .irregular("era"),
      thirdPersonPlural: .irregular("eran")),
    future: .regular,
    conditional: .regular)
  
}
