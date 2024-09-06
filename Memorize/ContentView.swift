//
//  ContentView.swift
//  Memorize
//
//  Created by Vanda Savkina on 20/04/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👺", "😱", "🏴‍☠️", "🍭"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjuster
        }
        .padding()
    }
    
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }
        .foregroundColor(.orange)
    }
    
    
    //var cardRemover: some View {
    //Button(action: {
    //  if cardCount > 1 {
    //     cardCount -= 1
    //}
    //}, label: {
    //  Image(systemName: "rectangle.stack.fill.badge.minus")
    // })
    //}
    
    //    var cardAdder: some View {
    //        Button(action: {
    //            if cardCount < emojis.count {
    //                cardCount += 1
    //            }
    //        }, label: {
    //            Image(systemName: "rectangle.stack.fill.badge.plus")
    //        })
    //    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill(.opacity(isFaceUp ? 0 : 1))
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

