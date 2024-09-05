import lustre
import lustre/attribute
import lustre/element
import lustre/element/html

pub fn main() {
  let styles = [
    #("position", "absolute"),
    #("top", "50%"),
    #("left", "0"),
    #("right", "0"),
    #("text-align", "center"),
    #("margin", "auto"),
    #("font-family", "Rajdhani, sans-serif"),
  ]
  let nav_style = [
    #("position", "fixed"),
    #("width", "100%"),
    #("margin", "auto"),
    #("justify-content", "flex-end"),
    #("left", "0"),
    #("right", "100%"),
    #("bottom", "0"),
  ]

  let nav_link_style = [#("margin-right", "10px")]

  let nav_pages = [
    #("postion", "absolute"),
    #("width", "100%"),
    #("height", "4vh"),
    #("justify-content", "flex-start"),
  ]

  let nav_ul = [
    #("position", "relative"),
    #("text-align", "center"),
    #("margin-left", "10px"),
    #("font-size", "1.5rem"),
    #("width", "50%"),
    #("font-family", "Rajdhani, sans-serif"),
  ]

  let nav_span = [
    #("margin-inline", "1rem")
  ]
  let app =
    lustre.element(
      html.div([], [
        html.h1([attribute.style(styles)], [
          element.text("Kyle Smith"),
          html.h6([], [element.text("BrakeZap")]),
        ]),
        html.nav([attribute.style(nav_style)], [
          html.ul([], [
            html.li([attribute.style(nav_link_style)], [
              html.a(
                [
                  attribute.href("https://github.com/BrakeZap"),
                  attribute.style(nav_link_style),
                ],
                [
                  html.img([
                    attribute.src("images/github-mark.png"),
                    attribute.width(50),
                  ]),
                ],
              ),
              html.a([attribute.href("#")], [
                html.img([
                  attribute.src("images/In-White-128@2x.png"),
                  attribute.width(50),
                ]),
              ]),
            ]),
          ]),
        ]),
        html.nav([attribute.style(nav_pages)], [
          html.ul([attribute.style(nav_ul)], [
            html.span([attribute.style(nav_span)], [html.a([attribute.href("#")], [html.text("Projects")]),
            html.span([attribute.style(nav_span)], [html.a([attribute.href("#")], [html.text("Meows")])])]),
          ]),
        ]),
      ]),
    )
  // let app =
  //   lustre.element(html.div([], [html.text("test")]))
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}
