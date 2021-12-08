//
//  HomeView.swift
//  Prompted
//
//  Created by Sarah Lichter on 12/7/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                HStack {
                    Text("Prompted")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                
                NavigationLink(destination: PromptsView(store: store)) {
                    VStack (alignment: .leading) {
                        HStack {
                            Text(store.value.displayPrompt.category.rawValue)
                                .accessibilityIdentifier("category")
                            Spacer()
                            Image(systemName: "arrow.clockwise")
                                .onTapGesture {
                                    store.send(.homeFeed(.refreshPrompt))
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
                    }
                    .padding(Spacing.defaultViewMargin)
                    .background(
                        RoundedRectangle(cornerRadius: 8).fill(.black)
                    )
                }

            }
            .padding(Spacing.defaultViewMargin/2)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(store: Store(value: AppState(), reducer: appReducer))
    }
}
