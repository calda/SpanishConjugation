//
//  SpanishDictVerb.swift
//  SpanishConjugation
//
//  Created by Cal Stephens on 7/11/21.
//

struct SpanishDictResponse: Decodable {
  let verb: SpanishDictVerb
}

struct SpanishDictVerb: Decodable {
  let infinitive: String
  let infinitiveTranslation: String
  let paradigms: SpanishDictTenses
}

struct SpanishDictTenses: Decodable {
  let presentIndicative: [SpanishDictConjugatedWord]
  let preteritIndicative: [SpanishDictConjugatedWord]
  let imperfectIndicative: [SpanishDictConjugatedWord]
  let conditionalIndicative: [SpanishDictConjugatedWord]
  let futureIndicative: [SpanishDictConjugatedWord]
  let presentSubjunctive: [SpanishDictConjugatedWord]
  let imperfectSubjunctive: [SpanishDictConjugatedWord]
  let imperfectSubjunctive2: [SpanishDictConjugatedWord]
  let futureSubjunctive: [SpanishDictConjugatedWord]
  let imperative: [SpanishDictConjugatedWord]
  let negativeImperative: [SpanishDictConjugatedWord]
  let presentContinuous: [SpanishDictConjugatedWord]
  let preteritContinuous: [SpanishDictConjugatedWord]
  let imperfectContinuous: [SpanishDictConjugatedWord]
  let conditionalContinuous: [SpanishDictConjugatedWord]
  let futureContinuous: [SpanishDictConjugatedWord]
  let presentPerfect: [SpanishDictConjugatedWord]
  let preteritPerfect: [SpanishDictConjugatedWord]
  let pastPerfect: [SpanishDictConjugatedWord]
  let conditionalPerfect: [SpanishDictConjugatedWord]
  let futurePerfect: [SpanishDictConjugatedWord]
  let presentPerfectSubjunctive: [SpanishDictConjugatedWord]
  let pastPerfectSubjunctive: [SpanishDictConjugatedWord]
  let futurePerfectSubjunctive: [SpanishDictConjugatedWord]
}

struct SpanishDictConjugatedWord: Decodable {
  let pronoun: SpanishDictPronoun
  let word: String
  let translation: String?
  let wordIrregular: String?
}

enum SpanishDictPronoun: String, Decodable {
  case yo
  case nosotros
  case tú
  case usted = "Ud."
  case ustedes = "Uds."
  case vos
  case vosotros
  case élEllaUsted = "él\u{002F}ella\u{002F}Ud."
  case ellosEllasUstedes = "ellos\u{002F}ellas\u{002F}Uds."
}
