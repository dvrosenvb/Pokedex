//
//  HomeEntity.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 19/04/22.
//

import Foundation

public struct PokemonHomeModel:Codable {
    var id:Int?
    var name:String?
    var url:String?
}

public struct PokemonHomeModelCodable:Codable {
    var results:[item]
}

public struct item:Codable{
    var id:Int?
    var name:String?
    var url:String?
}



// MARK: - PokemonByName
struct PokemonByName: Codable {
    var abilities: [Ability]?
    var baseExperience: Int?
    var forms: [Species]?
    var gameIndices: [GameIndex]?
    var height: Int?
    var heldItems: [HeldItem]?
    var id: Int?
    var isDefault: Bool?
    var locationAreaEncounters: String?
    var moves: [Move]?
    var name: String?
    var order: Int?
    var pastTypes: [JSONAny]?
    var species: Species?
    var sprites: Sprites?
    var stats: [Stat]?
    var types: [TypeElement]?
    var weight: Int?

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience
        case forms
        case gameIndices
        case height
        case heldItems
        case id
        case isDefault
        case locationAreaEncounters
        case moves, name, order
        case pastTypes
        case species, sprites, stats, types, weight
    }
}

// MARK: - Ability
struct Ability: Codable {
    var ability: Species?
    var isHidden: Bool?
    var slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden
        case slot
    }
}

// MARK: - Species
struct Species: Codable {
    var name: String?
    var url: String?
}

// MARK: - GameIndex
struct GameIndex: Codable {
    var gameIndex: Int?
    var version: Species?

    enum CodingKeys: String, CodingKey {
        case gameIndex
        case version
    }
}

// MARK: - HeldItem
struct HeldItem: Codable {
    var item: Species?
    var versionDetails: [VersionDetail]?

    enum CodingKeys: String, CodingKey {
        case item
        case versionDetails
    }
}

// MARK: - VersionDetail
struct VersionDetail: Codable {
    var rarity: Int?
    var version: Species?
}

// MARK: - Move
struct Move: Codable {
    var move: Species?
    var versionGroupDetails: [VersionGroupDetail]?

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    var levelLearnedAt: Int?
    var moveLearnMethod, versionGroup: Species?

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt
        case moveLearnMethod
        case versionGroup
    }
}

// MARK: - GenerationV
struct GenerationV: Codable {
    var blackWhite: Sprites?

    enum CodingKeys: String, CodingKey {
        case blackWhite
    }
}

// MARK: - GenerationIv
struct GenerationIv: Codable {
    var diamondPearl, heartgoldSoulsilver, platinum: Sprites?

    enum CodingKeys: String, CodingKey {
        case diamondPearl
        case heartgoldSoulsilver
        case platinum
    }
}

// MARK: - Versions
struct Versions: Codable {
    var generationI: GenerationI?
    var generationIi: GenerationIi?
    var generationIii: GenerationIii?
    var generationIv: GenerationIv?
    var generationV: GenerationV?
    var generationVi: [String: Home]?
    var generationVii: GenerationVii?
    var generationViii: GenerationViii?

    enum CodingKeys: String, CodingKey {
        case generationI
        case generationIi
        case generationIii
        case generationIv
        case generationV
        case generationVi
        case generationVii
        case generationViii
    }
}

// MARK: - Sprites
class Sprites: Codable {
    var backDefault: String?
    var backFemale: JSONNull?
    var backShiny: String?
    var backShinyFemale: JSONNull?
    var frontDefault: String?
    var frontFemale: JSONNull?
    var frontShiny: String?
    var frontShinyFemale: JSONNull?
    var other: Other?
    var versions: Versions?
    var animated: Sprites?

    enum CodingKeys: String, CodingKey {
        case backDefault
        case backFemale
        case backShiny
        case backShinyFemale
        case frontDefault
        case frontFemale
        case frontShiny
        case frontShinyFemale
        case other, versions, animated
    }

    init(backDefault: String?, backFemale: JSONNull?, backShiny: String?, backShinyFemale: JSONNull?, frontDefault: String?, frontFemale: JSONNull?, frontShiny: String?, frontShinyFemale: JSONNull?, other: Other?, versions: Versions?, animated: Sprites?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.other = other
        self.versions = versions
        self.animated = animated
    }
}

// MARK: - GenerationI
struct GenerationI: Codable {
    var redBlue, yellow: RedBlue?

    enum CodingKeys: String, CodingKey {
        case redBlue
        case yellow
    }
}

// MARK: - RedBlue
struct RedBlue: Codable {
    var backDefault, backGray, backTransparent, frontDefault: String?
    var frontGray, frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault
        case backGray
        case backTransparent
        case frontDefault
        case frontGray
        case frontTransparent
    }
}

// MARK: - GenerationIi
struct GenerationIi: Codable {
    var crystal: Crystal?
    var gold, silver: Gold?
}

// MARK: - Crystal
struct Crystal: Codable {
    var backDefault, backShiny, backShinyTransparent, backTransparent: String?
    var frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault
        case backShiny
        case backShinyTransparent
        case backTransparent
        case frontDefault
        case frontShiny
        case frontShinyTransparent
        case frontTransparent
    }
}

// MARK: - Gold
struct Gold: Codable {
    var backDefault, backShiny, frontDefault, frontShiny: String?
    var frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault
        case backShiny
        case frontDefault
        case frontShiny
        case frontTransparent
    }
}

// MARK: - GenerationIii
struct GenerationIii: Codable {
    var emerald: Emerald?
    var fireredLeafgreen, rubySapphire: Gold?

    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen
        case rubySapphire
    }
}

// MARK: - Emerald
struct Emerald: Codable {
    var frontDefault, frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault
        case frontShiny
    }
}

// MARK: - Home
struct Home: Codable {
    var frontDefault: String?
    var frontFemale: JSONNull?
    var frontShiny: String?
    var frontShinyFemale: JSONNull?

    enum CodingKeys: String, CodingKey {
        case frontDefault
        case frontFemale
        case frontShiny
        case frontShinyFemale
    }
}

// MARK: - GenerationVii
struct GenerationVii: Codable {
    var icons: DreamWorld?
    var ultraSunUltraMoon: Home?

    enum CodingKeys: String, CodingKey {
        case icons
        case ultraSunUltraMoon
    }
}

// MARK: - DreamWorld
struct DreamWorld: Codable {
    var frontDefault: String?
    var frontFemale: JSONNull?

    enum CodingKeys: String, CodingKey {
        case frontDefault
        case frontFemale
    }
}

// MARK: - GenerationViii
struct GenerationViii: Codable {
    var icons: DreamWorld?
}

// MARK: - Other
struct Other: Codable {
    var dreamWorld: DreamWorld?
    var home: Home?
    var officialArtwork: OfficialArtwork?

    enum CodingKeys: String, CodingKey {
        case dreamWorld
        case home
        case officialArtwork
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    var frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault
    }
}

// MARK: - Stat
struct Stat: Codable {
    var baseStat, effort: Int?
    var stat: Species?

    enum CodingKeys: String, CodingKey {
        case baseStat
        case effort, stat
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    var slot: Int?
    var type: Species?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }


    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}



// MARK: - Welcome
struct PokemonTypeModel: Codable {
    var damageRelations: DamageRelations?
    var gameIndices: [GameIndexType]?
    var generation: Generation?
    var id: Int?
    var moveDamageClass: Generation?
    var moves: [Generation]?
    var name: String?
    var names: [Name]?
    var pastDamageRelations: [PastDamageRelation]?
    var pokemon: [Pokemon]?

    enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
        case gameIndices = "game_indices"
        case generation, id
        case moveDamageClass = "move_damage_class"
        case moves, name, names
        case pastDamageRelations = "past_damage_relations"
        case pokemon
    }
}

// MARK: - DamageRelations
struct DamageRelations: Codable {
    var doubleDamageFrom, doubleDamageTo, halfDamageFrom, halfDamageTo: [Generation]?
    var noDamageFrom, noDamageTo: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case doubleDamageFrom = "double_damage_from"
        case doubleDamageTo = "double_damage_to"
        case halfDamageFrom = "half_damage_from"
        case halfDamageTo = "half_damage_to"
        case noDamageFrom = "no_damage_from"
        case noDamageTo = "no_damage_to"
    }
}

// MARK: - Generation
struct Generation: Codable {
    var name: String?
    var url: String?
}

// MARK: - GameIndex
struct GameIndexType: Codable {
    var gameIndex: Int?
    var generation: Generation?

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case generation
    }
}

// MARK: - Name
struct Name: Codable {
    var language: Generation?
    var name: String?
}

// MARK: - PastDamageRelation
struct PastDamageRelation: Codable {
    var damageRelations: DamageRelations?
    var generation: Generation?

    enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
        case generation
    }
}

// MARK: - Pokemon
struct Pokemon: Codable {
    var pokemon: Generation?
    var slot: Int?
}

