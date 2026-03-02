// # Note. Nota.

#import "../packages.typ": drafting
#import "../style/style.typ": font_family_sans, simple_spacing_for_smaller_text

#drafting.set-margin-note-defaults(
  stroke: none,
)

#let color_of_fill_of_notes = oklch(100%, 0, 90deg)
#let paint_of_stroke_of_notes = oklch(80.78%, 0, 0deg)
#let thickness_of_stroke_of_notes = 1.5pt

#let box_of_prefix = (
  default_fill: color_of_fill_of_notes,
  default_stroke: paint_of_stroke_of_notes,
  prefix: (
    body: none,
    color: none,
  ),
) => {
  set text(weight: "bold")
  box(
    fill: if (
      prefix.keys().contains("color")
    ) {
      prefix.color
    } else {
      default_fill.mix(color.luma(95%))
    },
    inset: 6pt,
    stroke: default_stroke,
    prefix.body,
  )
}

#let block_of_note(
  fill: none,
  prefixes: none,
  stroke: none,
  width: auto,
  it,
) = {
  set text(
    font: font_family_sans,
  )
  set par(first-line-indent: 0pt)
  block(
    breakable: false,
    clip: true,
    fill: fill,
    radius: 6pt,
    stroke: stroke,
    width: width,

    grid(
      rows: 2,
      if (prefixes != none) {
        // Converts a prefix dictionary into an array of a single element, in case the user has inputted the prefixes incorrectly as not an array.
        if (type(prefixes) == dictionary) {
          prefixes = (prefixes,)
        }
        set par(
          spacing: simple_spacing_for_smaller_text,
        )
        for prefix in prefixes {
          box_of_prefix(
            default_fill: fill,
            default_stroke: stroke,
            prefix: prefix,
          )
        }
      },

      block(
        inset: 6pt,
        it,
      ),
    ),
  )
}

#let handle_stroke = stroke_object => {
  let converted_stroke = stroke(stroke_object)
  let paint = converted_stroke.paint
  let thickness = converted_stroke.thickness

  if (paint == auto) {
    paint = paint_of_stroke_of_notes
  }
  if (thickness == auto) {
    thickness = thickness_of_stroke_of_notes
  }

  stroke(
    cap: converted_stroke.cap,
    dash: converted_stroke.dash,
    join: converted_stroke.join,
    miter-limit: converted_stroke.miter-limit,
    paint: paint,
    thickness: thickness,
  )
}

#let default_arguments_of_note = (
  prefixes: none,
) => (
  fill: color_of_fill_of_notes,
  rect: (
    fill: none,
    stroke: none,
    width: auto,
    it,
  ) => block_of_note(
    fill: fill,
    prefixes: prefixes,
    stroke: handle_stroke(stroke),
    width: width,
    it,
  ),
  stroke: stroke(
    paint_of_stroke_of_notes + thickness_of_stroke_of_notes,
  ),
)

#let inline_note = drafting.inline-note.with(..default_arguments_of_note())
#let margin_note = drafting.margin-note.with(..default_arguments_of_note())

#let create_prefixed_inline_note = (prefixes: none) => drafting.inline-note.with(
  ..default_arguments_of_note(prefixes: prefixes),
)
#let create_prefixed_margin_note = (prefixes: none) => drafting.margin-note.with(
  ..default_arguments_of_note(prefixes: prefixes),
)

#let create_prefixed_margin_or_inline_note = (
  arguments: (:),
  margin: false,
  prefixes: none,
  it,
) => {
  if (margin) {
    create_prefixed_margin_note(
      prefixes: prefixes,
    )(
      ..arguments,
      it,
    )
  } else {
    create_prefixed_inline_note(
      prefixes: prefixes,
    )(
      ..arguments,
      it,
    )
  }
}

#let create_status_note = (
  arguments: (:),
  color: color_of_fill_of_notes,
  margin: false,
  prefixes: none,
  status: "NOTA",
  it,
) => {
  let arguments_keys = arguments.keys()
  if (not arguments_keys.contains("fill")) {
    arguments.fill = color
  }
  if (not arguments_keys.contains("stroke")) {
    arguments.stroke = color.darken(15%)
  }

  let prefix_of_status = (body: status)

  create_prefixed_margin_or_inline_note(
    arguments: arguments,
    margin: margin,
    prefixes: (
      ..prefixes,
      prefix_of_status,
    ),
    it,
  )
}

#let todo_note = (
  arguments: (:),
  margin: false,
  prefixes: none,
  it,
) => {
  create_status_note(
    arguments: arguments,
    color: oklch(91.95%, 0.117, 93.14deg),
    margin: margin,
    status: "AFAZER",
    prefixes: prefixes,
    it,
  )
}

#let progress_note = (
  arguments: (:),
  margin: false,
  prefixes: none,
  it,
) => {
  create_status_note(
    arguments: arguments,
    color: oklch(90.73%, 0.142, 115.79deg),
    margin: margin,
    status: "PROGRESSO",
    prefixes: prefixes,
    it,
  )
}

#let done_note = (
  arguments: (:),
  margin: false,
  prefixes: none,
  it,
) => {
  create_status_note(
    arguments: arguments,
    color: oklch(85.66%, 0.082, 235.93deg),
    margin: margin,
    status: "FEITO",
    prefixes: prefixes,
    it,
  )
}

#let open_discussion_note = (
  arguments: (:),
  margin: false,
  prefixes: none,
  it,
) => {
  create_status_note(
    arguments: arguments,
    color: oklch(78.14%, 0.117, 248.13deg),
    margin: margin,
    status: "ABERTO",
    prefixes: prefixes,
    it,
  )
}

#let closed_discussion_note = (
  arguments: (:),
  margin: false,
  prefixes: none,
  it,
) => {
  create_status_note(
    arguments: arguments,
    color: oklch(78.14%, 0.05, 248.13deg),
    margin: margin,
    status: "FECHADO",
    prefixes: prefixes,
    it,
  )
}

#let prefixed_note = (
  arguments: (:),
  margin: false,
  note: create_prefixed_margin_or_inline_note,
  prefixes: none,
  it,
) => {
  note(
    arguments: arguments,
    margin: margin,
    prefixes: prefixes,
    it,
  )
}
