namespace QuantumExamples.Program {
    
    open Microsoft.Quantum.Intrinsic; // for Message
    
    @EntryPoint()
    operation Run() : Unit { // Result {
        let max = 50;
        Message($"Sampling a random number between 0 and {max}: ");
        // return Random.GetRandomNumberInRange(max);
    }
}
