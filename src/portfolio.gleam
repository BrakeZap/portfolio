import gleam/uri.{type Uri}
import lustre
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html
import lustre/effect.{type Effect}
import modem

type Route {
  Home
  Projects
  Resume
}

type Msg {
  OnRouteChange(Route)
}

fn on_url_change(uri: Uri){
  case uri.path_segments(uri.path) {
    ["projects"] -> OnRouteChange(Projects)
    ["home"] -> OnRouteChange(Home)
    ["resume"] -> OnRouteChange(Resume)
    _ -> OnRouteChange(Home)
  }
}

fn init(_flags) -> #(Route, Effect(Msg)){
  #(Home, modem.init(on_url_change))
}


fn update(_, msg: Msg) -> #(Route, Effect(Msg)){
  case msg {
    OnRouteChange(route) -> {
      #(route, effect.none())
    }
  }
}


fn view(route: Route) -> Element(Msg) {
  case route {
    Home -> {
      view_home()
    }
    Projects -> {
      view_projects()
    }
    Resume -> {
      view_resume()
    }
  }
}


fn view_projects() {
  html.div([], [element.text("Projects go here")])
}

fn view_resume() {
  html.embed([attribute.src("images/Resume.pdf"), attribute.width(800), attribute.height(1200)])
}

fn view_home() {
  let h1_style = [
    #("position", "absolute"),
    #("top", "40%"),
    #("left", "0"),
    #("right", "0"),
    #("width", "100%"),
    #("text-align", "center"),
    #("margin", "auto"),
    #("whitespace", "nowrap"),
    #("overflow", "hidden"),
    #("font-family", "Rajdhani, sans-serif"),
    //#("background-color", "green"),
  //#("border-color", "transparent"),
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
    #("postion", "fixed"),
    #("width", "100%"),
    #("height", "4vh"),
    #("background-color", "#173363"),
  ]

  let nav_ul = [
    #("position", "relative"),
    #("text-align", "center"),
    #("left", "85%"),
    #("margin", "10px"),
    #("font-size", "1.5rem"),
    #("width", "100%"),
    #("font-family", "Rajdhani, sans-serif"),
  ]

  let nav_span = [#("margin-inline", "1rem")]

  let footer_style = [
    #("position", "fixed"),
    #("top", "95%"),
    #("left", "0"),
    #("right", "0"),
    #("text-align", "center"),
  ]

      html.div([attribute.class("bg-pan-left")], [
        html.h6([attribute.style(h1_style)], [
          element.text("Hi, my name is "),
          html.h1([], [
            element.text("Kyle Smith"),
            html.div([], [element.text("👋")]),
            html.h6([], [
              element.text("I am a "),
              html.h1([], [element.text("Software Engineer")]),
            ]),
          ]),
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
            html.span([attribute.style(nav_span)], [
              html.a([attribute.href("/projects")], [html.text("Projects")]),
              html.span([attribute.style(nav_span)], [
                html.a([attribute.href("/resume")], [html.text("Resume")]),
              ]),
            ]),
          ]),
        ]),
        html.footer([attribute.style(footer_style)], [
          html.a([attribute.href("https://github.com/BrakeZap/portfolio")], [
            html.text("Made using Gleam 😊"),
          ]),
        ]),
        //html.div([attribute.style(typing_style)], [element.text("wow")]),
      ])
}

pub fn main() {


  let app = lustre.application(init, update, view)

  let assert Ok(_) = lustre.start(app, "#app", Nil)
  Nil
}
