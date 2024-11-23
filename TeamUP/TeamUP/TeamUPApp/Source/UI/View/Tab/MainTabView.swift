//
//  ContentView.swift
//  ProjectMoyo
//
//  Created by Soom on 11/15/24.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject private var postViewModel: PostViewModel
    @State private var selectedTab: Tab = .home
    @State private var isPostPresented: Bool = false
    
    enum Tab {
        case home
        case lounge
        case post
        case chat
        case profile
    }
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom){
                VStack(alignment: .center,spacing: 0) {
                    Spacer()
                    switch selectedTab {
                    case .home:
                        HomeView()
                        
                    case .lounge:
                        LoungeView()
                        
                    case .post:
                        EmptyView()
                        
                    case .chat:
                        ChatSelectView()
                        
                    case .profile:
                        MyProfileView()
                    }
                }
                TabBar(selectedTab: $selectedTab, isPostPresented: $isPostPresented)
                    .frame(alignment: .bottom)
                    .background(.white)
            }
            .fullScreenCover(isPresented: $isPostPresented) {
                PostView()
            }
            .onAppear {
                Task {
                    try await postViewModel.fetchPosts { result in
                        switch result {
                        case .success(let data):
                            postViewModel.setData(posts: data)
                        case .failure:
                            break
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}



#Preview {
    MainTabView()
        .environmentObject(AuthManager())
        .environmentObject(PostViewModel())
}
