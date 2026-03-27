// # List of symbols. Lista de símbolos.
// NBR 14724:2024 4.2.1.12

#import "../../../academic_work/components/entry_on_simple_glossary_lists.typ": print_gloss
#import "./glossary.typ": include_glossary_page

#let include_list_of_symbols_page(
  invisible: false,
  symbols_entries,
) = {
  include_glossary_page(
    disable_back_references: true,
    invisible: invisible,
    print_gloss: print_gloss,
    title: "Lista de símbolos",
    outlined: false,
    symbols_entries,
  )
}
