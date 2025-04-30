import ProjectDescription

let project = Project(
  name: "ChildProject",
  targets: [
    .target(
      name: "ChildProjectFramework",
      destinations: .macOS,
      product: .framework,
      bundleId: "io.tuist.ChildProjectFramework",
      deploymentTargets: .macOS("15.0"),
      sources: ["Sources/Core/**"]
    ),
    .target(
      name: "ChildProject",
      destinations: .macOS,
      product: .app,
      bundleId: "io.tuist.ChildProject",
      deploymentTargets: .macOS("15.0"),
      infoPlist: .default,
      sources: ["Sources/ExampleApp/**"],
      dependencies: []
    ),
  ]
)
