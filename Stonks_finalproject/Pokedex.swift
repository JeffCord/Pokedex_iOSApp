//
//  Pokedex.swift
//  Stonks_finalproject
//
//  Created by Soha Dessouky on 4/27/20.
//  Copyright © 2020 Jeffrey Cordes. All rights reserved.
//

import UIKit
import Foundation

protocol PokedexProtocol {
    func responseDataHandler(data:NSDictionary)
    func responseError(message:String)
}

class Pokedex {
    var delegate:PokedexProtocol?
    let urlSession = URLSession.shared
    private var dataTask:URLSessionDataTask? = nil
    //var formattedName:String = ""
    private let urlPathBase = "https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/pokedex.php?&format=json&"
    
    init() {}
    
    
    // MARK: FIRST: take user input and scan list of all Pokemon for "Poke-name"
    
    func getPokeName(userInput:String, completion: @escaping (String) -> ()) {
        //userInput:String) -> String {
        let urlPath = self.urlPathBase
        let key = "pokedex=all"
        let namesURL = urlPath + key
        let PokemonURLNames = URL(string: namesURL)!
        var formattedName:String = ""
        
        let task = urlSession.dataTask(with: PokemonURLNames) { data, response, error in
            
            if error != nil || data == nil {
                print("error: \(error!.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Server error")
                    return
            }
            if let mime = httpResponse.mimeType, mime == "text/plain" {
                let string = String(data: data!, encoding: .utf8)
                //print(string as! String)
                
                let namesArr = string?.components(separatedBy: "\n")
                
                guard let found = namesArr?.first(where: {$0.substring(to: $0.firstIndex(of: ":")!) == userInput}) else {
                    print("Name doesn't exist")
                    return
                }
                let i = found.firstIndex(of: ":")!
                let index = found.index(i, offsetBy: 1)
                formattedName = String(found[index...])
            } else {
                formattedName = "Error"
            }
            completion(formattedName)
        }
        task.resume()
    }
    
    
    // MARK: SECOND: take poke-name (formatted name) and tack that onto the link in order to search for Pokemon info
    
    func getData(name:String) {
        let urlPath = self.urlPathBase
        var formattedName:String = ""
        
        getPokeName(userInput: name) { (passedString) -> () in
            formattedName = passedString
            let key = "pokemon=" + formattedName
            let pokemon = urlPath + key
            
            let myPokemon = URL(string: pokemon)!
            
            let dataTask = self.urlSession.dataTask(with: myPokemon) { data, response, error in
                
                if error != nil || data == nil {
                    print("Client error")
                    return
                } else {
                    do {
                        guard let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary else {
                            print("Unable to get Poke data")
                            return
                        }
                        
                        self.delegate?.responseDataHandler(data: jsonResult)
                    
                    } catch {
                        self.delegate?.responseError(message:"Error: Pokemon was not found. Please check your spelling and make sure that the Pokemon is one of the first 151 Pokemon.")
                    }
                }
            }
            dataTask.resume()
        }
    }
//    
//    func getImage(imagePath:String) {
//        let urlPath = self.urlPathBase
//        let key = "pokedex=" + imagePath
//        let imagePath = urlPath + key
//        
//        let pokemonImg = URL(string: imagePath)!
//        let dataTask = self.urlSession.dataTask(with: pokemonImg) { data, response, error in
//                    
//            if error != nil || data == nil {
//                print("Client error")
//                return
//            } else {
//                do {
//                    guard let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary else {
//                        print("Unable to get Poke data")
//                        return
//                    }
//                    
//                    self.delegate?.responseDataHandler(data: jsonResult)
//                    
//                } catch {
//                    self.delegate?.responseError(message:"Error: Pokemon was not found. Please check your spelling and make sure that the Pokemon is one of the first 151 Pokemon.")
//                }
//            }
//        }
//        dataTask.resume()
//    }
}
//
//
