// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
// let recipes = try? newJSONDecoder().decode(Recipes.self, from: jsonData)

// swiftlint:disable identifier_name
// MARK: - Recipes
struct Recipes: Codable {
    let query: String
    let from, to: Int
    let more: Bool
    let count: Int
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe
    let bookmarked, bought: Bool
}

enum Caution: String, Codable {
    case fodmap = "FODMAP"
    case sulfites = "Sulfites"
}

// MARK: - Digest
struct Digest: Codable {
    let label, tag: String
    let schemaOrgTag: SchemaOrgTag?
    let total: Double
    let hasRDI: Bool
    let daily: Double
    let unit: Unit
    let sub: [Digest]?
}

enum SchemaOrgTag: String, Codable {
    case carbohydrateContent
    case cholesterolContent
    case fatContent
    case fiberContent
    case proteinContent
    case saturatedFatContent
    case sodiumContent
    case sugarContent
    case transFatContent
}

enum Unit: String, Codable {
    case empty = "%"
    case gram = "g"
    case kilocalories = "kcal"
    case milligrams = "mg"
    case microgram = "µg"
}

enum HealthLabel: String, Codable {
    case alcoholFree = "Alcohol-Free"
    case immunoSupportive = "Immuno-Supportive"
    case peanutFree = "Peanut-Free"
    case sugarConscious = "Sugar-Conscious"
    case treeNutFree = "Tree-Nut-Free"
}

// MARK: - Total
struct Total: Codable {
    let label: String
    let quantity: Double
    let unit: Unit
}
