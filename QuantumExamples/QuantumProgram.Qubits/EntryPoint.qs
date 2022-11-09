namespace QuantumExamples.QuantumProgram.Qubits {
    
    open Microsoft.Quantum.Intrinsic;   // for H operation
    open Microsoft.Quantum.Measurement; // for MResetZ


    @EntryPoint()
    operation Run() : Result {
        use qubit = Qubit();   // allocates qubit for use (automatically in |0>)
        H(qubit);              // puts qubit in superposition of |0> and |1>
        return MResetZ(qubit); // measures qubit
    }
}
