#import "../common/template.typ": template as common_template
#import "../common/components/heading.typ": format_heading

#let template(
  doc,
  color_of_links: none,
  number_pages: false,
  should_display_editor_notes: true,
) = {
  // ## Headings. Títulos.
  // NBR 6024:2012.
  show heading: set heading(
    supplement: "Subseção",
  )
  show heading.where(level: 1): set heading(supplement: "Seção")

  // ### Format. Formatação.
  show heading: it => {
    format_heading(
      it,
    )
  }

  common_template(
    doc,
    color_of_links: color_of_links,
    should_display_editor_notes: should_display_editor_notes,
  )
}
