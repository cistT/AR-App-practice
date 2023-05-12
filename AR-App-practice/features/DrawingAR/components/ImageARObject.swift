import SwiftUI
import RealityKit
import ARKit

struct ImageObject: UIViewRepresentable {
    

    private let image:UIImage
    
    init(image:UIImage) {
        self.image=image
    }
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        let configuration = ARWorldTrackingConfiguration()
     
        configuration.planeDetection = [.horizontal]
        arView.session.run(configuration)
        
        //https://qiita.com/john-rocky/items/77dd077a5778c7ca9369
        let anchor = AnchorEntity( plane: .horizontal)
 
        anchor.position = simd_make_float3(0, 0, 0)
        
        let box = ModelEntity(mesh: .generateBox(size: simd_make_float3(0.5, 0.5, 0.01)))
        
        var imageMaterial = UnlitMaterial()
        do{
            let texture=try TextureResource.generate(
                from: image.cgImage!,
               
                options:.init(semantic:.normal )
            )
            

            imageMaterial.baseColor = MaterialColorParameter.texture(texture)
            imageMaterial.tintColor = UIColor.white.withAlphaComponent(0.99)
            
           
            box.model?.materials=[imageMaterial]
        }catch{
            
        }
      
        
        box.transform = Transform(pitch: 0, yaw: 0.3, roll: 0)
                
        anchor.addChild(box)
        arView.scene.anchors.append(anchor)
      
      
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}


