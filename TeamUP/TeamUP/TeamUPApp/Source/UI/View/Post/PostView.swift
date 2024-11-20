//
//  PostView.swift
//  ProjectMoyo
//
//  Created by Soom on 11/15/24.
//

import SwiftUI
import MarkdownUI

struct PostView: View {
    
    @State private var postCategory = "프로젝트 모집"
    let categories = ["프로젝트 모집", "스터디 모집", "Q & A", "잡담"]
    
    @State private var postTitle: String = ""
    
    @State private var isPreviewMode = false
    
    @State private var markdownText: String = ""
    
    @State private var tags: [String] = []
    @State private var newTag: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        CategorySelectedView()
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 10)
                        
                        TextField("제목을 입력하세요", text: $postTitle)
                            .background(Color.clear)
                            .font(.semibold26)
                        
                        TextField("태그를 입력한 후 엔터를 눌러주세요", text: $newTag, onCommit: {
                            addTag()
                        })
                        .font(.system(size: 16))
                        
                        
                        TagView(tags: $tags)
                        
                        ToggleButtonView(isPreviewMode: $isPreviewMode)
                            .padding(.top, 20)
                    }
                    .padding(.trailing, 60)
                    
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.3)
                            .frame(width: 360, height: 500)
                        
                        if isPreviewMode {
                            Markdown(markdownText)
                                .padding(25)
                        } else {
                            TextEditorView(markdownText: $markdownText)
                        }
                    }
                    
                    Spacer()
                }
            }
            Button {
                
            } label : {
                Text("작성 완료")
                    .frame(width: 360, height: 50)
                    .font(.semibold20)
                    .foregroundColor(.white)
                    .background(Color.customBlue)
                    .cornerRadius(4)
            }
            
        }
        .padding(20)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                XMarkButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Text("임시저장")
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                }
            }
        }
        .navigationTitle("글 올리기")
    }
    
    func addTag() {
        if !newTag.isEmpty {
            tags.append(newTag)
            newTag = ""
        }
    }
    
}

#Preview {
    PostView()
}
