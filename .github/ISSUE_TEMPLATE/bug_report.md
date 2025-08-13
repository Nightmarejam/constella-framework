name: "Bug report"
about: "Something broken in docs or CI"
labels: ["bug"]
body:
  - type: textarea
    id: what
    attributes: {label: What happened?, description: Steps + expected vs actual}
    validations: {required: true}
