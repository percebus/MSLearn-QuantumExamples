// SRC: https://learn.microsoft.com/en-us/azure/quantum/user-guide/host-programs?tabs=tabid-csharp
namespace QuantumExamples.QuantumLib {
    
    // These are like 'using' in C#
    open Microsoft.Quantum.Canon;       // for ApplyToEach
    open Microsoft.Quantum.Intrinsic;   // for H operation
    open Microsoft.Quantum.Measurement; // for MResetZ
    open Microsoft.Quantum.Math;        // for BitSizeI
    open Microsoft.Quantum.Convert;     // for ResultArrayAsInt
    open Microsoft.Quantum.Arrays;      // for ForEach
    

    operation MeasureQubit() : Result {
        use qubit = Qubit();   // allocates qubit for use (automatically in |0>)
        H(qubit);              // puts qubit in superposition of |0> and |1>
        return MResetZ(qubit); // measures qubit, returns result (and resets it to |0> before deallocation)
    }


    // SRC: https://learn.microsoft.com/en-us/azure/quantum/user-guide/
    operation MeasureQubitIsOne() : Result {
        use qubit = Qubit();   // allocates qubit for use (automatically in |0>)
        H(qubit);              // puts qubit in superposition of |0> and |1>

        let result = M(qubit); // Now we measure the qubit in Z-basis.
        if result == One {     // We reset the qubit before releasing it. 
            X(qubit); 
        }

        return result;         // Finally, we return the result of the measurement.    
    }


    operation MeasureQubits(n : Int) : Result[] {
        use qubits = Qubit[n];           // allocate a register of n qubits in |0> 
        ApplyToEach(H, qubits);          // apply H to each qubit in the register

        // NOTE: ForEach is like a "map" function
        return ForEach(MResetZ, qubits); // perform MResetZ on each qubit, returns the resulting array
    }


    // AKA: SampleRandomNumberInRange
    // SRC: https://github.com/hsirtl/devops-for-quantum-computing-azure-function/blob/main/src/QApp.Qsharp/Program.qs
    operation MeasureQubits2(n : Int) : Result[] {
        use qubits = Qubit[n];  // create a register of n qubits
        ApplyToEach(H, qubits); // put each qubit in superposition
        return MultiM(qubits);  // measure all qubits and return the result
    }


    operation GetRandomQuantumNumberInRange(max : Int) : Int {
        mutable output = 0; 
        repeat {
            mutable bits = []; 
            for idxBit in 1..BitSizeI(max) {
                set bits += [MeasureQubit()]; 
            }
            set output = ResultArrayAsInt(bits);
        } until (output <= max);
        return output;
    }

}
