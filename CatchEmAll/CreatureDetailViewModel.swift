//
//  CreatureDetailViewModel.swift
//  CatchEmAll
//
//  Created by Remi Pacifico Hansen on 11/7/22.
//

import Foundation

@MainActor
class CreatureDetailViewModel: ObservableObject {
    
    private struct Returned: Codable {
        var height: Double
        var weight: Double
        var sprites: Sprite
    }

    struct Sprite: Codable {
        var front_default: String?
        var other: Other
    }
    
    struct Other: Codable {
        var officialArtwork: OfficialArtwork
        
        enum CodingKeys: String, CodingKey {
            case officialArtowrk = "official-artwork"
        }
    }
    
    struct OfficialArtwork: Codable {
        var front_default: String
    }
    
    var urlString = ""
    @Published var height = 0.0
    @Published var weight = 0.0
    @Published var imageURL = ""
    
    
    func getData() async {
        
        print("🕸 We are accessing the url \(urlString)")
    //    convert urlString to a special URL type
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
    //        try to decode JSON data into our own data structures
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else{
                print("😡 JSON ERROR: Could not decode returned JSON data")
                return
            }
//          TODO: Decode JSON into class's properties
            self.height = returned.height
            self.weight = returned.weight
            self.imageURL = returned.sprites.other.officialArtwork.front_default ?? "n/a"
        }catch {
            print("😡 ERROR: Could not use URL at \(urlString) to get data and response")
        }
    }
}

