    //
    //  ParserHelper.swift
    //  CTask
    //
    //  Created by akshay on 3/6/20.
    //  Copyright © 2020 akshay. All rights reserved.
    //
    
    import Foundation
    
    protocol Parceable {
        static func parseObject(dictionary: [String: Any]) -> Result<Self, ErrorResult>
    }
    
    final class ParserHelper {
        
        static func parse<T: Parceable>(data: Data, completion : (Result<[T], ErrorResult>) -> Void) {
            
            do {
                
                if let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any] {
                    
                    // init final result
                    var finalResult : [T] = []
                    
                    
                    for object in result {
                        if let dictionary = object as? [String : Any] {
                            
                            // check foreach dictionary if parseable
                            switch T.parseObject(dictionary: dictionary) {
                            case .failure(_):
                                continue
                            case .success(let newModel):
                                finalResult.append(newModel)
                                break
                            }
                        }
                    }
                    
                    completion(.success(finalResult))
                    
                } else {
                    // not an array
                    completion(.failure(.parser(string: "Json data is not an array")))
                }
            } catch {
                // can't parse json
                completion(.failure(.parser(string: "Error while parsing json data")))
            }
        }
        
        static func parse<T: Parceable>(data: Data, completion : (Result<T, ErrorResult>) -> Void) {
            
            do {
                
                if let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                    
                    // init final result
                    // check foreach dictionary if parseable
                    switch T.parseObject(dictionary: dictionary) {
                    case .failure(let error):
                        completion(.failure(error))
                        break
                    case .success(let newModel):
                        print("Api success!")
                        completion(.success(newModel))
                        break
                    }
                    
                    
                } else {
                    // not an array
                    completion(.failure(.parser(string: "Json data is not an array")))
                }
            } catch {
                // can't parse json
                completion(.failure(.parser(string: "Error while parsing json data")))
            }
        }
    }
