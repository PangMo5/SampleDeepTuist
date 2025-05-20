import ProjectDescription

let project = Project(
  name: "ChildProject",
  settings: .settings(configurations: [.release(name: "Production"), .debug(name: "Test")]),
  targets: [
    .target(
      name: "ChildProjectFramework",
      destinations: .iOS,
      product: .framework,
      bundleId: "io.tuist.ChildProjectFramework",
      deploymentTargets: .iOS("16.0"),
      sources: ["Sources/Core/**"]
    ),
    .target(
      name: "ChildProject",
      destinations: .iOS,
      product: .app,
      bundleId: "io.tuist.ChildProject",
      deploymentTargets: .iOS("16.0"),
      infoPlist: .default,
      sources: ["Sources/ExampleApp/**"],
      dependencies: []
    ),
  ],
  schemes: [
    .scheme(
      name: "ChildProject",
      buildAction: .buildAction(targets: ["ChildProject"]),
      runAction: .runAction(configuration: "Test"),
    ),
  ]
)
