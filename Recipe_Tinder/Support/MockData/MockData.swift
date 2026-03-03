//
//  MockData.swift
//  Recipe_Tinder
//
//  Created by Sebastian C on 1/28/26.
//

import Foundation

struct MockData {

    static let users: [User] = [

        .init(id: NSUUID().uuidString, username: "Mexican Food", profileImageURLS: ["mex_food", "mexFood2"], bio: "Tacos, salsas, and bold authentic spice.", extendedBio: "Mexican cuisine celebrates bold spices, fresh ingredients, and comforting dishes rooted in tradition — from vibrant salsas to slow-cooked favorites meant to be shared."),

        .init(id: NSUUID().uuidString, username: "Italian Food", profileImageURLS: ["pasta", "pasta2"], bio: "Pasta, pizza, and classic comfort flavors.", extendedBio: "Italian cooking is all about simple ingredients, rich sauces, and comforting flavors that bring people together through pasta, bread, and timeless classics."),

        .init(id: NSUUID().uuidString, username: "American Food", profileImageURLS: ["amer1", "amer2"], bio: "Burgers, BBQ, and all-time favorites.", extendedBio: "American cuisine blends comfort, creativity, and regional favorites — delivering hearty, familiar dishes that satisfy every craving."),

        .init(id: NSUUID().uuidString, username: "Chinese Food", profileImageURLS: ["chin1", "chin2"], bio: "Savory stir-fries, noodles, and dumplings.", extendedBio: "Chinese cuisine balances savory, sweet, and aromatic flavors through stir-fries, noodles, and traditional recipes built around harmony and texture."),

        .init(id: NSUUID().uuidString, username: "Indian Food", profileImageURLS: ["ind1", "ind2"], bio: "Rich curries, warm spices, big flavor.", extendedBio: "Indian cuisine layers vibrant spices and slow-cooked techniques to create deeply flavorful dishes that celebrate culture, warmth, and tradition."),

        .init(id: NSUUID().uuidString, username: "Mediterranean Food", profileImageURLS: ["med1", "med2"], bio: "Fresh herbs, olive oil, and bright plates.", extendedBio: "Mediterranean cuisine focuses on fresh vegetables, grains, herbs, and healthy fats — delivering light yet flavorful dishes inspired by coastal living."),

        .init(id: NSUUID().uuidString, username: "Japanese Food", profileImageURLS: ["jap1", "jap2"], bio: "Sushi, ramen, and clean umami bites.", extendedBio: "Japanese cuisine emphasizes balance, freshness, and precision — delivering clean flavors and beautifully crafted dishes that celebrate simplicity."),

        .init(id: NSUUID().uuidString, username: "Korean Food", profileImageURLS: ["kor1", "kor2"], bio: "K-BBQ, kimchi, and spicy-sweet heat.", extendedBio: "Korean cuisine is bold and dynamic, blending spicy, sweet, and fermented flavors into comforting meals built around sharing and variety."),

        .init(id: NSUUID().uuidString, username: "Greek Food", profileImageURLS: ["gre1", "gre2"], bio: "Gyros, feta, and lemony comfort.", extendedBio: "Greek cuisine highlights fresh herbs, olive oil, and bright Mediterranean flavors in dishes designed to be wholesome, vibrant, and shared."),

        .init(id: NSUUID().uuidString, username: "Filipino Food", profileImageURLS: ["fil1", "fil2"], bio: "Adobo, lumpia, and sweet-savory classics.", extendedBio: "Filipino cuisine combines sweet, savory, and tangy flavors influenced by rich cultural traditions, creating comforting dishes full of character."),

        .init(id: NSUUID().uuidString, username: "Thai Food", profileImageURLS: ["thai1", "thai2"], bio: "Sweet, spicy, and aromatic classics.", extendedBio: "Thai cuisine balances sweet, spicy, sour, and salty flavors with fragrant herbs and comforting noodles and curries."),

        .init(id: NSUUID().uuidString, username: "Vietnamese Food", profileImageURLS: ["viet1", "viet2"], bio: "Fresh herbs, noodles, and bright broths.", extendedBio: "Vietnamese cuisine is known for fresh herbs, light sauces, and comforting soups like pho and bun bowls."),

        .init(id: NSUUID().uuidString, username: "French Food", profileImageURLS: ["pasta", "pasta2"], bio: "Rich sauces, pastries, and classics.", extendedBio: "French cuisine is famous for refined techniques, rich sauces, and timeless comfort dishes."),

        .init(id: NSUUID().uuidString, username: "Spanish Food", profileImageURLS: ["span1", "span2"], bio: "Tapas, paella, and bold flavor.", extendedBio: "Spanish cuisine shines with small plates, seafood, and vibrant spices — perfect for sharing."),

        .init(id: NSUUID().uuidString, username: "Lebanese Food", profileImageURLS: ["leb1", "leb2"], bio: "Hummus, shawarma, and fresh plates.", extendedBio: "Lebanese cuisine features bright flavors, grilled meats, dips, and fresh herbs."),

        .init(id: NSUUID().uuidString, username: "Brazilian Food", profileImageURLS: ["braz1", "braz2"], bio: "Hearty plates and grilled favorites.", extendedBio: "Brazilian cuisine mixes comfort foods, grilled meats, and regional specialties full of flavor.")
    ]
}
