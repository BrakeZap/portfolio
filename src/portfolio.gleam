import lustre/ui
import lustre/ui/button
import lustre
import lustre/attribute
import lustre/element



pub fn main() {
  let styles = [#("width", "100vw"), #("height", "100vh"), #("padding", "1rem")]
  let app = lustre.element(ui.centre([attribute.style(styles)], 
  ui.button([button.solid()],[
    element.text("Wowee")
  ])))



  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}
