import SwiftUI
import RealityKit
import ARKit

struct CharacterObject: UIViewRepresentable {
    
    private let word:String
    private let color:UIColor
    
    init(word: String,color:UIColor) {
        self.word = word
        self.color = color
    }
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        arView.session.run(configuration)
        
        //https://qiita.com/john-rocky/items/77dd077a5778c7ca9369
        let anchor = AnchorEntity(plane: .horizontal)
        
        anchor.position = simd_make_float3(0, 0, 0)

        let material = SimpleMaterial(color: color,isMetallic: false )
        let text = ModelEntity(mesh: .generateText(word,extrusionDepth: 0.03, font: .systemFont(ofSize: 0.1, weight: .bold), containerFrame: CGRect.zero, alignment: .center, lineBreakMode: .byCharWrapping),materials: [material])
        
     
      
        text.transform = Transform(pitch: 0, yaw: 0.3, roll: 0)
                
        anchor.addChild(text)
        arView.scene.anchors.append(anchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}


