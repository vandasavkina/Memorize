//
//  ContentView.swift
//  Memorize
//
//  Created by Vanda Savkina on 20/04/24.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: Array<String> = ["👻", "👻", "🎃", "🎃", "🕷️", "🕷️", "😈", "😈", "💀", "💀", "🕸️", "🕸️", "🧙‍♀️", "🧙‍♀️", "🙀", "🙀", "👺", "👺", "😱", "😱", "🏴‍☠️", "🏴‍☠️", "🍭", "🍭"]
    @State var travelEmojis: [String] = ["🚗", "🚗", "🚌", "🚌", "🛶", "🛶", "🚄", "🚄", "🛸", "🛸", "✈️", "✈️", "🚀", "🚀", "⛵️", "⛵️", "🛥️", "🛥️", "🚁", "🚁"]
    @State var summerEmojis: [String] = ["🏄‍♂️", "🏄‍♂️", "🤿", "🤿", "⛱️", "⛱️", "🛵", "🛵", "☀️", "☀️", "🌊", "🌊", "👙", "👙", "🩴", "🩴"]
    @State var mountainEmojis: Array<String> = ["🐗", "🐗", "🍄", "🍄", "⛷️", "⛷️", "🧗🏻‍♂️", "🧗🏻‍♂️", "🏔️", "🏔️", "🪓", "🪓", "🧺", "🧺", "🔦", "🔦", "📻", "📻", "🗺️", "🗺️", "🚡", "🚡", "🏒", "🏒", "🚴🏾‍♀️", "🚴🏾‍♀️", "🧶", "🧶"]
    
    @State var isEmojis: Bool = false
    @State var isTravelEmojis: Bool = false
    @State var isSummerEmojis: Bool = false
    @State var isMountainEmojis: Bool = false
    @State var switchEmojis: Bool = true
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            
            ScrollView {
                switch switchEmojis {
                case isEmojis:
                    cards
                case isTravelEmojis:
                        travelCards
                case isSummerEmojis:
                        summerCards
                case isMountainEmojis:
                        mountainCards
                default:
                    cards
                }
            }
            Spacer()
            HStack {
                Button(action: {
                    isEmojis = true
                }, label: {
                    VStack {
                        Image(systemName: "figure.wave.circle")
                            .font(.largeTitle)
                        Text("Halloween")
                    }
                })
                Spacer()
                Button(action: {
                    isTravelEmojis = true
                }, label: {
                    VStack {
                        Image(systemName: "airplane")
                            .font(.largeTitle)
                        Text("Travel")
                    }
                })
                Spacer()
                Button(action: {
                    isSummerEmojis = true
                }, label: {
                    VStack {
                        Image(systemName: "sun.min")
                            .font(.largeTitle)
                        Text("Sumemr")
                    }
                })
                
                Spacer()
                Button(action: {
                    isMountainEmojis = true
                }, label: {
                    VStack {
                        Image(systemName: "mountain.2")
                            .font(.largeTitle)
                        Text("Mountain")
                    }
                })
            }
            .padding()
        }
        .padding()
    }
    
//    var cardCountAdjusters: some View {
//        HStack {
//            cardRemover
//            Spacer()
//            cardAdder
//        }
//        .imageScale(.large)
//        .font(.largeTitle)
//    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
            ForEach(emojis.indices.shuffled(), id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var travelCards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
            ForEach(travelEmojis.indices.shuffled(), id: \.self) { index in
                CardView(content: travelEmojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.red)
    }
    
    var summerCards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
            ForEach(summerEmojis.indices.shuffled(), id: \.self) { index in
                CardView(content: summerEmojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
    }
    
    var mountainCards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
            ForEach(mountainEmojis.indices.shuffled(), id: \.self) { index in
                CardView(content: mountainEmojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.yellow)
    }
    
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button(action: {
//            cardCount += offset
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//    }
//    
//    var cardRemover: some View {
//        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
//    }
//    
//    var cardAdder: some View {
//        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
//    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

