//
//  Word+SpanishDictVerb.swift
//  SpanishConjugation
//
//  Created by Cal Stephens on 7/11/21.
//

extension Word {
  init(from spanishDictVerb: SpanishDictVerb) {
    var translation = spanishDictVerb.infinitiveTranslation
    
    if
      let providedTranslation = translation,
      !providedTranslation.starts(with: "to ")
    {
      translation = "to \(providedTranslation)"
    }
    
    self = Word(
      infinitive: spanishDictVerb.infinitive,
      translation: translation,
      present: .init(named: "Present", from: spanishDictVerb.paradigms.presentIndicative),
      preterite: .init(named: "Preterite", from: spanishDictVerb.paradigms.preteritIndicative),
      pastImperfect: .init(named: "Imperfect", from: spanishDictVerb.paradigms.imperfectIndicative),
      future: .init(named: "Future", from: spanishDictVerb.paradigms.futureIndicative),
      conditional: .init(named: "Conditional", from: spanishDictVerb.paradigms.conditionalIndicative))
  }
}

extension ConjugatedTense {
  fileprivate init(
    named name: String,
    from words: [SpanishDictConjugatedWord]?)
  {
    self = ConjugatedTense(
      tense: name,
      firstPersonSingular: ConjugatedForm(from: words?.first(where: { $0.pronoun == .yo })),
      firstPersonPlural: ConjugatedForm(from: words?.first(where: { $0.pronoun == .nosotros })),
      secondPersonSingular: ConjugatedForm(from: words?.first(where: { $0.pronoun == .tú })),
      secondPersonPlural: ConjugatedForm(from: words?.first(where: { $0.pronoun == .ellosEllasUstedes })),
      thirdPersonSingular: ConjugatedForm(from: words?.first(where: { $0.pronoun == .élEllaUsted })),
      thirdPersonPlural: ConjugatedForm(from: words?.first(where: { $0.pronoun == .ellosEllasUstedes })))
  }
}

extension ConjugatedForm {
  fileprivate init(from spanishDictWord: SpanishDictConjugatedWord?) {
    guard let spanishDictWord = spanishDictWord else {
      self = ConjugatedForm(
        text: "--",
        isIrregular: false)
      return
    }
    
    self = ConjugatedForm(
      text: spanishDictWord.word,
      isIrregular: spanishDictWord.wordIrregular != nil)
  }
}
