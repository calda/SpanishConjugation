//
//  Conjugation.swift
//  SpanishConjugation
//
//  Created by Cal Stephens on 7/8/21.
//

struct BaseConjugation: Conjugated {
  let name: String
  let firstPersonSingular: String
  let firstPersonPlural: String
  let secondPersonSingular: String
  let secondPersonPlural: String
  let thirdPersonSingular: String
  let thirdPersonPlural: String
}

extension BaseConjugation {
  
  /// The present tense -- "I walk" / "I am walking"
  static var present = BaseConjugation(
    name: "Present",
    firstPersonSingular: "o", // camino
    firstPersonPlural: "amos", // caminamos
    secondPersonSingular: "as", // caminas
    secondPersonPlural: "an", // caminan
    thirdPersonSingular: "a", // camina
    thirdPersonPlural: "an") // caminan
  
  /// The preterite tense -- "I walked"
  static var preterite = BaseConjugation(
    name: "Preterite",
    firstPersonSingular: "é", // caminé
    firstPersonPlural: "amos", // caminamos
    secondPersonSingular: "aste", // caminaste
    secondPersonPlural: "aron", // caminaron
    thirdPersonSingular: "ó", // caminó
    thirdPersonPlural: "aron") // caminaron
  
  /// The past imperfect tense -- "I was walking" / "I used to walk"
  static var pastImperfect = BaseConjugation(
    name: "Past Imperfect",
    firstPersonSingular: "aba", // caminaba
    firstPersonPlural: "ábamos", // caminábamos
    secondPersonSingular: "abas", // caminabas
    secondPersonPlural: "aban", // caminaban
    thirdPersonSingular: "aba", // caminaba
    thirdPersonPlural: "aban") // caminaban
  
  /// The future tense -- "I will walk"
  static var future = BaseConjugation(
    name: "Future",
    firstPersonSingular: "aré", // caminaré
    firstPersonPlural: "aremos", // caminaramos
    secondPersonSingular: "arás", // caminarás
    secondPersonPlural: "arán", // caminará
    thirdPersonSingular: "ará", // caminará
    thirdPersonPlural: "arán") // caminarán
  
  /// The future tense -- "I would walk"
  static var conditional = BaseConjugation(
    name: "Conditional",
    firstPersonSingular: "aría", // caminaría
    firstPersonPlural: "aríamos", // caminaríamos
    secondPersonSingular: "arías", // caminarías
    secondPersonPlural: "arían", // caminarían
    thirdPersonSingular: "aría", // caminaría
    thirdPersonPlural: "arían") // caminarían
}
