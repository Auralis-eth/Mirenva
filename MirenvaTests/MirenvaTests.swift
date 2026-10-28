import Testing

@Suite("Mirenva foundation")
struct MirenvaTests {
    @Test("Unit test target executes")
    func targetExecutes() {
        #expect(2 + 2 == 4)
    }
}
