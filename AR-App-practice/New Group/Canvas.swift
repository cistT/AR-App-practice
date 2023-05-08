import Foundation
import SwiftUI
import PencilKit

struct Canvas : UIViewRepresentable{

    private let pkcView:PKCanvasView
    private let toolPicker:PKToolPicker
    private let data : Data?
    

    init(pkcView: PKCanvasView,toolPicker:PKToolPicker,data:Data?) {
        self.pkcView = pkcView
        self.toolPicker=toolPicker
        self.data = data
    }
       func makeUIView(context: Context) -> PKCanvasView {
          
           pkcView.isOpaque = true
           pkcView.backgroundColor = .clear
           pkcView.becomeFirstResponder()
           pkcView.drawingPolicy = PKCanvasViewDrawingPolicy.anyInput
           
           if let unwrappeddata = data{
               do{
                   pkcView.drawing = try PKDrawing(data:unwrappeddata)
               }catch{
                   print("error")
               }
           }
          

           toolPicker.addObserver(pkcView)
           toolPicker.setVisible(true, forFirstResponder: pkcView)

           return pkcView
       }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    
    }
}
