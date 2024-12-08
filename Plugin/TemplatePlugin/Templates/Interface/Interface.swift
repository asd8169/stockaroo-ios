import ProjectDescription

private let nameAttribute = Template.Attribute.required("name")
private let layerAttribute = Template.Attribute.required("layer")
private let authorAttribute: Template.Attribute = .required("author")
private let currentDateAttribute: Template.Attribute = .required("currentDate")

private let template = Template(
    description: "A template for a new module's interface target",
    attributes: [
        layerAttribute,
        nameAttribute,
        authorAttribute,
        currentDateAttribute
    ],
    items: [
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Interface/\(nameAttribute)Interface.swift",
            templatePath: "Interface.stencil"
        )
    ]
)

