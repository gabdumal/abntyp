// # Post-textual elements. Elementos pós-textuais.
// NBR 6022:2018 5.3

#import "../components.typ": include_acknowledgements, include_annex, include_appendix, include_glossary
#import "../data/glossary/main.typ": glossary_entries

// ## Glossary. Glossário.
// NBR 6022:2018 5.3.2
#include_glossary(
  disable_back_references: true,
  glossary_entries,
)

#counter(heading).update(0)
#include_appendix(
  title: [Quod idem licet transferre in voluptatem, ut],
  label: <anexo:quod>,
)[
  #lorem(50)
]

#counter(heading).update(0)
#include_annex(
  title: [Quod idem licet transferre in voluptatem, ut],
  label: <anexo:quod>,
)[
  #lorem(50)
]

// # Acknowledgments. Agradecimentos.
// NBR 6022:2018 5.3.5
#include_acknowledgements[
  #lorem(10)
]
