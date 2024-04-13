//
//  WriteView.swift
//  WoodsYouWrite
//
//  Created by 조우현 on 4/13/24.
//

import SwiftUI

struct WriteView: View {
    @AppStorage("notes") private var notes = ""
    @State var selectedDate: Date = Date()
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                EditorView()
                    .padding()
            }
            .navigationTitle(selectedDate.formatted(.dateTime.day().month().year()))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showAlert = true
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.red)
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        // 일기저장 후 메인화면으로 이동
                    } label: {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .alert("일기를 삭제하시겠습니까?", isPresented: $showAlert) {
                Button("삭제", role: .destructive) {
                    notes = "" // 데이터 삭제
                    dismiss()
                }
                Button("취소", role: .cancel) { }
            }
        }
    }
}

// MARK: - EditorView

struct EditorView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        ZStack {
            TextEditor(text: $notes)
            
            if notes.isEmpty {
                VStack {
                    Text("작성된 일기가 없습니다.")
                        .font(.title3)
                    Text("탭하여 작성하기")
                        .font(.callout)
                }
                .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    WriteView()
}
