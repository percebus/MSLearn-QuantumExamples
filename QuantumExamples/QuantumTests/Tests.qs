namespace QuantumExamples.QuantumLib.Tests {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;

    
    // Run on multiple targets
    @Test("QuantumSimulator")
    @Test("ToffoliSimulator")
    @Test("ResourcesEstimator")
    operation AllocateQubit () : Unit {
        use qubit = Qubit();
        AssertMeasurement(
            [PauliZ], 
            [qubit], 
            Zero, 
            "Newly allocated qubit must be in |0> state.");

        Message("Test passed.");
    }

    // Run on multiple targets
    @Test("QuantumSimulator")
    @Test("ResourcesEstimator")
//  @Test("ToffoliSimulator") // FIXME "Not Implemented"
    operation SuperpositionQubit() : Unit {
        use qubit = Qubit();
        H(qubit);
        AssertMeasurement(
            [PauliX], 
            [qubit], 
            Zero, 
            "The state of the quantum register is not |+〉");

        ResetAll([qubit]);
        
        // Even though we do not have access to states in Q#,
        // we know by the anthropic principle that the state
        // of register at this point is |+〉.
    }
}
