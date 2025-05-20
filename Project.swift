import ProjectDescription

let project = Project(
  name: "SampleDeepTuist",
  settings: .settings(configurations: [.release(name: "Production"), .debug(name: "Test")]),
  targets: [
    .target(
      name: "SampleDeepTuist",
      destinations: .iOS,
      product: .app,
      bundleId: "io.tuist.SampleDeepTuist",
      infoPlist: .default,
      sources: ["SampleDeepTuist/Sources/**"],
      resources: ["SampleDeepTuist/Resources/**"],
      dependencies: [
        .project(target: "ChildProjectFramework", path: "ChildProject"),
      ]
    ),
    .target(
      name: "SampleDeepTuistFramework",
      destinations: .iOS,
      product: .framework,
      bundleId: "io.tuist.SampleDeepTuistFramework",
      infoPlist: .default,
      sources: ["ChildProject/Sources/Core/**"],
    ),
    .target(
      name: "SampleDeepTuistTests",
      destinations: .iOS,
      product: .unitTests,
      bundleId: "io.tuist.SampleDeepTuistTests",
      infoPlist: .default,
      sources: ["SampleDeepTuist/Tests/**"],
      resources: [],
      dependencies: [.target(name: "SampleDeepTuist")]
    ),
  ],
  schemes: [
    .scheme(
      name: "SampleDeepTuist",
      buildAction: .buildAction(targets: ["SampleDeepTuist"]),
      runAction: .runAction(configuration: "Production"),
    ),
    .scheme(
      name: "SampleDeepTuist",
      buildAction: .buildAction(targets: ["SampleDeepTuist"]),
      runAction: .runAction(configuration: "Test"),
    ),
  ]
)
