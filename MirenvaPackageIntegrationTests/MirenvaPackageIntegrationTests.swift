import Testing

@Suite("Package integration target")
struct MirenvaPackageIntegrationTests {
    @Test("Integration test target executes")
    func targetExecutes() {
        #expect(true)
    }
}
