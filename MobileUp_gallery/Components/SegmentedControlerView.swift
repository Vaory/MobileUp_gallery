//
//  SegmentedControlerView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 25.08.2024.
//

import SwiftUI

struct SegmentedControlView: View {
    @State private var selectedSegment = 0
    
    var body: some View {
        VStack {
            SegmentedControl(selectedSegment: $selectedSegment)
                .frame(maxWidth: .infinity ,maxHeight: 32)
                .padding(.horizontal, 16)
            
            if selectedSegment == 0 {
                PhotosView()
            } else {
                VideosView()
            }
        }
    }

struct SegmentedControl: UIViewRepresentable {
    @Binding var selectedSegment: Int
    
    func makeUIView(context: Context) -> UISegmentedControl {
        let items = ["Фото", "Видео"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = selectedSegment
        segmentedControl.addTarget(context.coordinator, action: #selector(Coordinator.segmentChanged(_:)), for: .valueChanged)
        return segmentedControl
    }
    
    func updateUIView(_ uiView: UISegmentedControl, context: Context) {
        uiView.selectedSegmentIndex = selectedSegment
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: SegmentedControl
        
        init(_ parent: SegmentedControl) {
            self.parent = parent
        }
        
        @objc func segmentChanged(_ sender: UISegmentedControl) {
            parent.selectedSegment = sender.selectedSegmentIndex
        }
    }
}

    struct SegmentedControlView_Previews: PreviewProvider {
        static var previews: some View {
            SegmentedControlView()
        }
    }
}
