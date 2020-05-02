import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {

    let fillStyle = FillStyle(color:Color(.gray))
    let rectangle : Rectangle

    init() {
        rectangle = Rectangle(rect:Rect(), fillMode:.fill)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        rectangle.rect.size = canvasSize
    }

    override func render(canvas:Canvas) {
        canvas.render(fillStyle, rectangle)
    }

}
