//
//  ContentView.swift
//  Memorize
//
//  Created by Junkang Zhang on 05/08/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            Text(viewModel.gameTitle)
                .font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.themeColor)
            .padding(.horizontal)
            HStack{
                Text("Score: " + String(viewModel.score))
                Spacer()
                Text("New Game")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        viewModel.newGame()
                    }
            }
            .font(.title)
            .padding(.horizontal, 20)
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let game = EmojiMemoryGame()
            
            ContentView(viewModel: game)
                
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
        }
    }
}
