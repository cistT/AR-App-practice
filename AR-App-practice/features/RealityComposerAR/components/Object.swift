import SwiftUI
import RealityKit

struct Object: UIViewRepresentable {
    
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let boxAnchor = try! Experience.loadBox()
        
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}


