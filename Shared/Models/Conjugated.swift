//
//  Tense.swift
//  SpanishConjugation (iOS)
//
//  Created by Cal Stephens on 7/8/21.
//

protocol Conjugated {
  associatedtype Representation
  
  var firstPersonSingular: Representation { get }
  var firstPersonPlural: Representation { get }
  var secondPersonSingular: Representation { get }
  var secondPersonPlural: Representation { get }
  var thirdPersonSingular: Representation { get }
  var thirdPersonPlural: Representation { get }
}

extension Conjugated {
  var allCases: [Representation] {
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
