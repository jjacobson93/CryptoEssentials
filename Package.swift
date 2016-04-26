import PackageDescription

let package = Package(name: "CryptoEssentials",
                      exclude: [],
                      dependencies: [],
                      targets: [
                                   Target(
                                    name: "CryptoEssentials",
                                    dependencies: [
                                                      .Target(name: "CryptoEssentialsSwift2"),
                                                      .Target(name: "CryptoEssentialsSwift3")
                                    ]),
                                   Target(name: "CryptoEssentialsSwift2"),
                                   Target(name: "CryptoEssentialsSwift3"),
                                   Target(name: "Tests",
                                          dependencies: [.Target(name: "CryptoEssentials")])
    ]
)

