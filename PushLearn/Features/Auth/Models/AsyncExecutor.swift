enum AsyncExecutor {
    static func run(
        _ work: @escaping () async throws -> Void,
        handleError: @escaping (Error) -> Void
    ) {
        Task { @MainActor in
            do {
                try await work()
            } catch {
                handleError(error)
            }
        }
    }
}
