import ProjectDescription

let project = Project(
  name: "SampleDeepTuist",
  targets: [
    .target(
      name: "SampleDeepTuist",
      destinations: .macOS,
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
      destinations: .macOS,
      product: .framework,
      bundleId: "io.tuist.SampleDeepTuistFramework",
      infoPlist: .default,
      sources: ["ChildProject/Sources/Core/**"],
    ),
    .target(
      name: "SampleDeepTuistTests",
      destinations: .macOS,
      product: .unitTests,
      bundleId: "io.tuist.SampleDeepTuistTests",
      infoPlist: .default,
      sources: ["SampleDeepTuist/Tests/**"],
      resources: [],
      dependencies: [.target(name: "SampleDeepTuist")]
    ),
  ]
)
