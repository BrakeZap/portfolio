import lustre
import lustre/attribute
import lustre/element
import lustre/element/html
import lustre/ui

pub fn main() {
  let styles = [
    #("display", "flex"),
    #("align-items", "center"),
    #("justify-content", "center"),
    #("text-align", "center"),
    #("min-height", "100vh"),
  ]
  let h1_style = [#("font-family", "Rajdhani, sans-serif")]
  let app =
    lustre.element(ui.centre(
      [],
      html.div([attribute.style(styles)], [
        html.h1([attribute.style(h1_style)], [
          element.text("Kyle Smith"),
          html.h6([], [element.text("BrakeZap")]),
        ]),
      ]),
    ))

  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}
