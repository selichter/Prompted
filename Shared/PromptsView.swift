//
//  PromptsView.swift
//  Prompted
//
//  Created by Sarah Lichter on 11/26/21.
//

import SwiftUI

struct PromptsView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading) {

                Spacer()
                HStack {
                    Text(store.value.displayPrompt.category.rawValue)
                        .accessibilityIdentifier("category")
                    VStack {
                        store.value.displayPrompt.isFavorite ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                    }.onTapGesture {
                        store.send(.prompt(.toggleFavorite))
                    }
                        
                }
                .foregroundColor(.white)
                .font(.body)
                
                Text(store.value.displayPrompt.text)
                    .foregroundColor(.white)
                    .bold()
                    .font(.title)
                    .textCase(.uppercase)
                    .lineSpacing(2)
                    .padding(.bottom)
                    .accessibilityIdentifier("prompt")
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Num of Times Used")
                            
                        Text("\(store.value.displayPrompt.timesUsed)")
                            .accessibilityIdentifier("count")
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Last Used")
                        Text(store.value.displayPrompt.lastUsed?.description ?? "-")
                            .accessibilityIdentifier("lastUsed")
                    }
                }
                
                
                HStack {
                    Spacer()
                    if let _ =  store.value.displayPrompt.lastUsed {
                        Image(systemName: "checkmark.circle.fill")
                    } else {
                        Image(systemName: "checkmark.circle")
                            .onTapGesture {
                                store.send(.prompt(.markAsUsed))
                            }
                    }
                    Spacer()
                }
                .font(.title)
            }
            .foregroundColor(.white)
            .padding(.bottom, 100)
            .padding(Spacing.defaultViewMargin)
            
        }

    }
}

struct PromptsView_Previews: PreviewProvider {
    static var previews: some View {
        PromptsView(store: Store(value: AppState(), reducer: appReducer))
    }
}
