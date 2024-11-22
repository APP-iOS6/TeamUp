//
//  ProjectMoyoApp.swift
//  ProjectMoyo
//
//  Created by Soom on 11/15/24.
//

import SwiftUI

@main
struct ProjectMoyoApp: App {
    var body: some Scene {
        WindowGroup {
            StartTeamupView()
                .environmentObject(AuthManager()) // 인스턴스 전달
                .environmentObject(PostViewModel())
                .environmentObject(ApplicationViewModel())
        }
    }
}
