//
//  ContentView.swift
//  Memorize
//
//  Created by Junkang Zhang on 05/08/2021.
//

import SwiftUI

struct ContentView: View {

        

    var vehicles = ["🚒", "✈️", "🚐", "🚝", "🚤", "🚇","🛸","🛶"];
    var faces = ["😀", "😃", "😄", "😁", "😆", "😅","😂","🤣"];
    var animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊","🐻","🐼"];
    
    @State var count = 8;
    @State var arrayToDisplay: [String];
    
    init() {
        arrayToDisplay = animals;
    }
    
    var body: some View {
        VStack {
            Title()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(arrayToDisplay[..<count], id: \.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
            Spacer()
            HStack {
                vehiclesTheme
                Spacer()
                facesTheme
                Spacer()
                animalsTheme
            }
            .foregroundColor(.blue)
            .padding(.horizontal, 75)
            .font(.largeTitle)
        }
    }
    
    var vehiclesTheme: some View {
        VStack {
            Image(systemName: "car")
            Text("Vehicles")
                .font(.caption)
                
        }
        .onTapGesture {
            arrayToDisplay = shuffle(vehicles)
        }
    }
    
    var facesTheme: some View {
        VStack {
            Image(systemName: "face.smiling")
            Text("Faces")
                .font(.caption)
        }
        .onTapGesture {
            arrayToDisplay = shuffle(faces)
        }
    }
    
    var animalsTheme: some View {
        VStack {
            Image(systemName: "person")
            Text("Animals")
                .font(.caption)
        }
        .onTapGesture {
            arrayToDisplay = shuffle(animals)
        }
    }
    
    func shuffle(_ incoming: [String]) -> [String] {
        var res: [String] = []
        var array = incoming
        while array.count > 0 {
            let nextIdx = Int.random(in: 0..<array.count)
            res.append(array[nextIdx])
            array.remove(at: nextIdx)
        }
        return res
    }
}

struct Title: View {
    var body: some View {
        Text("Memorized!")
            .font(Font.largeTitle)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
