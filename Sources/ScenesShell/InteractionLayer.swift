import Igis
import Scenes
import ScenesControls

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer {


    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")


        // Create a standalone button, insert into LAYER, and assign handler
        let independentButton = Button(name:"Alone", labelString:"Stand Alone Button", topLeft:Point(x:50, y:50))
        insert(entity:independentButton, at:.front)
        independentButton.clickHandler = onButtonClickHandler

        // Create two panels, one vertical and one horizontal
        createPanel(name:"Vertical", labelString:"Vertical Panel", topLeft:Point(x:150, y:100), layoutStyle:.uniformColumn)
        createPanel(name:"Horizontal", labelString:"Horizontal Panel", topLeft:Point(x:150, y:300), layoutStyle:.uniformRow)
    }


    // Create a labeled panel with several buttons
    func createPanel(name:String, labelString:String, topLeft:Point, layoutStyle:Panel.LayoutStyle) {
        // Create and insert the panel into the LAYER
        let panel = Panel(name:name, topLeft:topLeft, layoutStyle:layoutStyle)
        insert(entity:panel, at:.front)

        // Create labels and buttons for panel and insert into PANEL
        let textLabel = TextLabel(name:name+"Label", labelString:labelString)
        let button2 = Button(name:name+"Button 1", labelString:"First")
        let button3 = Button(name:name+"Button 2", labelString:"Second")
        let button4 = Button(name:name+"Button 3", labelString:"Third")
        panel.insert(owningLayer:self, entity:textLabel)
        panel.insert(owningLayer:self, entity:button2)
        panel.insert(owningLayer:self, entity:button3)
        panel.insert(owningLayer:self, entity:button4)
        
        // Assign handlers
        textLabel.clickHandler = onLabelClickHandler
        button2.clickHandler = onButtonClickHandler
        button3.clickHandler = onButtonClickHandler
        button4.clickHandler = onButtonClickHandler
    }
    
    // Labels can respond to clicks but usually don't
    func onLabelClickHandler(control:Control, localLocation:Point) {
        if let textLabel = control as? TextLabel {
            textLabel.labelString += " More"
        }
    }

    // Buttons are generally only useful if they do respond to clicks
    func onButtonClickHandler(control:Control, localLocation:Point) {
        if let button = control as? Button {
            button.labelString += " More"
        }
    }
    
  }
