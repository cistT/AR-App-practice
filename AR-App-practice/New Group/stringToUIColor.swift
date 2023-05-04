import SwiftUI

func stringColorToUIColor(color:String)->UIColor{
    if color=="黒色"{
        return UIColor.black
    }
    
    if color=="青色"{
        return UIColor.blue
    }
    
    if color=="赤色"{
        return UIColor.red
    }
    
    if color=="白色"{
        return UIColor.white
    }
    
    if color=="緑色"{
        return UIColor.green
    }
    
    return UIColor.white
}
