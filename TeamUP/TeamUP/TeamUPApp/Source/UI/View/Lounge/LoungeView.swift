//
//  LoungeView.swift
//  ProjectMoyo
//
//  Created by Soom on 11/15/24.
//

import SwiftUI
let sampleRoungeData: [Rounge] = [
    Rounge(
        category: .qna,
        user: "관리자",
        title: "새로운 규정 공지",
        content: "새로운 규정이 추가되었습니다. 자세한 사항은 공지사항을 참조해 주세요.",
        reply: ["규정은 언제부터 적용되나요?", "상세한 내용은 어디에서 확인할 수 있나요?"],
        time: "2024-11-18 10:00",
        save: 120,
        seen: 350
    ),
    Rounge(
        category: .talk,
        user: "홍길동",
        title: "오늘 점심 뭐 먹을까요?",
        content: "여러분 오늘 점심 뭐 먹을지 고민인데 추천 좀 해주세요!",
        reply: ["김밥 어때요?", "치킨 좋죠!", "피자 먹고 싶어요!"],
        time: "2024-11-18 12:15",
        save: 40,
        seen: 150
    ),
    Rounge(
        category: .qna,
        user: "김철수",
        title: "iOS 프로젝트에서 List 뷰 사용법",
        content: "iOS 프로젝트에서 `List` 뷰를 사용하려면 어떻게 해야 하나요? 방법을 알고 싶은데 알려주세요!",
        reply: ["`List`는 데이터를 배열로 받아서 뷰를 생성해요.", "List의 아이템은 `ForEach`로 구성할 수 있습니다."],
        time: "2024-11-17 15:30",
        save: 25,
        seen: 200
    )
]

struct LoungeView: View {
    @State private var selectedCategory: RoungeCategory?
    @State private var isSheetPresented = false
    @State private var searchText: String = ""
    @State private var selectedSort: String = "최신순"
    
    var filteredItems: [Rounge] {
        var items = sampleRoungeData
        
        // 검색 텍스트 필터링
        if !searchText.isEmpty {
            items = items.filter { item in
                item.title.localizedCaseInsensitiveContains(searchText) ||
                item.content.localizedCaseInsensitiveContains(searchText)
            }
        }
        return items
    }
    
    var sortedItems: [Rounge] {
        switch selectedSort {
        case "최신순":
            return filteredItems.sorted { $0.time > $1.time }
        case "저장많은순":
            return filteredItems.sorted { $0.save > $1.save }
        case "조회순":
            return filteredItems.sorted { $0.seen > $1.seen }
        default:
            return filteredItems
        }
    }
    
    var body: some View {
        NavigationView {  // NavigationView로 감싸기
            VStack(alignment: .leading) {
                CustomSearchBar(searchText: $searchText, placeholder: "검색어를 입력해주세요 (ex 웹프로젝트, 알고리즘 스터디", onSearch: { text in
                    print("검색실행")
                })
                .padding(.horizontal)
                
                // 스터디 카테고리 필터링
                HStack(spacing: 5) {
                    ForEach([nil] + RoungeCategory.allCases, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }) {
                            VStack(spacing: 2){
                                Text(category?.rawValue ?? "전체")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(selectedCategory == category ? .black : .gray)
                                if selectedCategory == category {
                                    Rectangle()
                                        .frame(width: 30, height: 2)
                                        .foregroundColor(.blue)
                                        .animation(.easeInOut, value: selectedCategory)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top, 3)
                            .padding(.bottom, 10)
                        }
                    }
                    Spacer() // 버튼들을 왼쪽으로 밀기
                }
                
                // 최신순 저장많은순 조회순 필터링
                HStack {
                    Button(action: {
                        selectedSort = "최신순"
                    }) {
                        Text("• 최신순")
                            .foregroundColor(selectedSort == "최신순" ? .blue : .gray)
                    }
                    
                    Button(action: {
                        selectedSort = "저장많은순"
                    }) {
                        Text("• 저장많은순")
                            .foregroundColor(selectedSort == "저장많은순" ? .blue : .gray)
                    }
                    
                    Button(action: {
                        selectedSort = "조회순"
                    }) {
                        Text("• 조회순")
                            .foregroundColor(selectedSort == "조회순" ? .blue : .gray)
                    }
                }
                .padding(.horizontal)
                .font(.caption)
                .padding(.bottom, 10)
                Divider()
                List {
                    ForEach(sortedItems.filter { rounge in
                        if let selectedCategory = selectedCategory {
                            return rounge.category == selectedCategory
                        }
                        return true
                    }, id: \.title) { rounge in
                       // NavigationLink(destination: DetailView(post: rounge)) {  // NavigationLink 추가
                            HomeListRowView(model: rounge)
                                //.padding(.vertical, 5)
                        }
                        
                    
                }
                .listStyle(PlainListStyle())
            }
        }
    }
}
#Preview {
    LoungeView()
}
