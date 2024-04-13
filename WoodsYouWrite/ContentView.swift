//
//  ContentView.swift
//  WoodsYouWrite
//
//  Created by 조우현 on 4/11/24.
//

import SwiftUI


struct ContentView: View {
    @State var numOfJournal: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("모은 장작 개수")
                            .font(.title2)
                            .bold()
                        Text("\(numOfJournal)개")
                            .font(.largeTitle)
                            .bold()
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 0) {
                        VStack {
                            Text("🪵🪵")
                            Text("🪵")
                        }
                        .allowsTightening(false)
                        .padding(30)
                        .background {
                            Button {
                                //FierwoodView로 이동
                            } label: {
                                Circle()
                                    .frame(width: 80)
                                    .foregroundStyle(.black)
                                    .opacity(0.9)
                                    .shadow(radius: 10, y: 10)
                            }
                        }
                        Text("모아보기")
                            .foregroundStyle(.secondary)
                    }
                }
                .padding()
                
                Divider()
                    .padding(.horizontal)
                
                CalendarView()
                    .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                

                NavigationLink(destination: WriteView()) {
                    EditorView()
                }
                .padding()
                    
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        // settingView로 이동
                    } label: {
                        Image(systemName: "gearshape")
                            .foregroundStyle(.black)
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        // search action
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(numOfJournal: 8)
}

