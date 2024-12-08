import ProjectDescription

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.required("name")
private let authorAttribute: Template.Attribute = .required("author")
private let currentDateAttribute: Template.Attribute = .required("currentDate")

private let template = Template(
    description: "A template for a new module's testing target",
    attributes: [
        layerAttribute,
        nameAttribute,
        authorAttribute,
        currentDateAttribute
    ],
    items: [
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Testing/\(nameAttribute)Testing.swift",
            templatePath: "Testing.stencil"
        )
    ]
)
