#import "../common/template.typ": template as common_template

#let template(
  doc,
  // Whether to  print content on the back of pages — required.
  consider_only_odd_pages: true,
  number_pages: false,
) = {
  // ## Headings. Títulos.
  show heading.where(level: 1): set heading(supplement: [Capítulo])
  show heading.where(level: 2): set heading(supplement: [Seção])
  show heading.where(level: 3): set heading(supplement: [Subseção])
  show heading.where(level: 4): set heading(supplement: [Subsubseção])
  show heading.where(level: 5): set heading(supplement: [Subsubsubseção])

  common_template(
    doc,
    consider_only_odd_pages: consider_only_odd_pages,
    number_pages: number_pages,
  )
}
