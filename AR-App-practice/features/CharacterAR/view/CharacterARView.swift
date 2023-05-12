import SwiftUI

struct CharacterARView:View{
    
    private let showWord:String;
    private let color:UIColor;
    
    init(showWord: String, color: UIColor) {
        self.showWord = showWord
        self.color = color
    }
    
    
    var body:some View{
        CharacterObject(word:showWord,color:color).edgesIgnoringSafeArea(.all)
    }
}
