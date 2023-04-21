import SwiftUI
import RealityKit
import SceneKit

struct ContentView : View {
    @State private var isShowAR=false;
    @State private var showWord=""
 
    
    var body: some View {
      
        if isShowAR {
            ZStack{
                ARViewContainer(word:showWord).edgesIgnoringSafeArea(.all)

                Button(action: {
                    isShowAR.toggle()
                }){
                    Text("閉じる").font(.system(size:24)).foregroundColor(Color.white).background(Color.blue)
                }.padding(.top, 10.0).position(x:60,y:20)

            }

        }else{
            VStack{
                Text("AR練習用アプリ")
                    .font(.system(size:32))
                    .foregroundColor(Color.blue)
                
                Form{
                    TextField("表示させる文字を入力してください",text:$showWord)
                }.frame(height: 100)

                Button(action:{
                    isShowAR.toggle()
                }){
                    Text("AR表示").font(.system(size:24))
                }.padding(.top, 10.0).border(Color.blue)
                
                

            }
        }
        
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    var word:String
    
    init(word: String) {
        self.word = word
    }
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
        
        //https://qiita.com/john-rocky/items/77dd077a5778c7ca9369
        let anchor = AnchorEntity()
        anchor.position = simd_make_float3(0, -0.5, -1)

        let text = ModelEntity(mesh: .generateText(word, extrusionDepth: 0.03, font: .systemFont(ofSize: 0.1, weight: .bold), containerFrame: CGRect.zero, alignment: .center, lineBreakMode: .byCharWrapping))
      
        text.transform = Transform(pitch: 0, yaw: 0.3, roll: 0)
                
        anchor.addChild(text)
        arView.scene.anchors.append(anchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
