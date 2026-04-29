// # People. Pessoas.

#import "../../common/util/font_family.typ": font_family_for_common_text_state

#let print_person(
  person: (
    first_name: "Fulano",
    middle_name: none,
    last_name: "Fonseca",
    curriculum: [E-mail: #link("mailto:fulano@email.com").],
  ),
) = context {
  person.first_name + sym.space
  if person.middle_name != none {
    person.middle_name + sym.space
  }
  (
    person.last_name
      + text(
        font: font_family_for_common_text_state.get(),
        footnote(
          numbering: "*",
          person.curriculum,
        ),
      )
  )
}

#let print_people(
  people: (),
  joiner: linebreak(),
) = {
  (
    people
      .map(person => print_person(
        person: person,
      ))
      .join(
        joiner,
      )
  )
}
