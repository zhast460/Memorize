//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Junkang Zhang on 05/08/2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
