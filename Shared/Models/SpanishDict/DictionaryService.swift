//
//  DictionaryService.swift
//  SpanishConjugation
//
//  Created by Cal Stephens on 7/11/21.
//

import Foundation

struct DictionaryService {
  
  func fetchConjugations(
    for infinitive: String,
    completion: @escaping (Result<Word, Swift.Error>) -> Void)
  {
    let task = URLSession.shared.dataTask(with: requestURL(for: infinitive)) { data, _, error in
      guard let data = data else {
        completion(.failure(error ?? Error.requestFailed))
        return
      }
      
      // SpanishDict pages include a JSON payload in a <script> tag that sets `window.SD_COMPONENT_DATA`
      guard
        let response = String(data: data, encoding: .utf8),
        let sdComponentData = response.components(separatedBy: "window.SD_COMPONENT_DATA =").last?
          .components(separatedBy: "</script>")
          .first?
          .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines.union(CharacterSet(charactersIn: ";")))
      else {
        completion(.failure(Error.unknownResponseFormat))
        return
      }
      
      do {
        let response = try JSONDecoder().decode(SpanishDictResponse.self, from: Data(sdComponentData.utf8))
        completion(.success(Word(from: response.verb)))
      } catch {
        completion(.failure(error))
      }
    }
    
    task.resume()
  }
  
  private func requestURL(for infinitive: String) -> URL {
    let query = infinitive.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
    return URL(string: "https://www.spanishdict.com/conjugate/\(query)")!
  }
  
}

enum Error: LocalizedError {
  case requestFailed
  case unknownResponseFormat
}
