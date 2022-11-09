namespace QuantumExamples.QuantumLib {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics; // for DumpOperation

    // Real:
    // [
    //    [1, 0, 0, 0],
    //    [0, 0, 0, 1],
    //    [0, 0, 1, 0],
    //    [0, 1, 0, 0]
    // ]
    //
    // Imag:
    // [
    //    [0, 0, 0, 0],
    //    [0, 0, 0, 0],
    //    [0, 0, 0, 0],
    //    [0, 0, 0, 0]
    // ]
    operation DumpCnot() : Unit {
        DumpOperation(
            2, 
            ApplyToFirstTwoQubitsCA(CNOT, _)
        );
    }


    // # wave function for qubits with ids (least to most significant): 0;1
    // 0❭:	 0.707107 +  0.000000 i	 = 	**********           [ 0.500000 ]     --- [  0.00000 rad ]
    // 3❭:	 0.000000 +  0.000000 i	 = 	                     [ 0.000000 ]
    //
    // [ -π/16,   π/16)       ---
    // [  π/16,  3π/16)        /-
    // [ 3π/16,  5π/16)        / 
    // [ 5π/16,  7π/16)       +/ 
    // [ 7π/16,  9π/16)      ↑   
    // [ 8π/16, 11π/16)    \-    
    // [ 7π/16, 13π/16)    \     
    // [ 7π/16, 15π/16)   +\     
    // [15π/16, 19π/16)   ---    
    // [17π/16, 19π/16)   -/     
    // [19π/16, 21π/16)    /     
    // [21π/16, 23π/16)    /+    
    // [23π/16, 25π/16)      ↓   
    // [25π/16, 27π/16)       -\ 
    // [27π/16, 29π/16)        \ 
    // [29π/16, 31π/16)        \+
    // [31π/16,   π/16)       ---
    operation MultiQubitDumpMachineDemo() : Unit {
       use qubits = Qubit[2];
       X(qubits[1]);
       H(qubits[1]);
       R1Frac(1, 2, qubits[1]);
       DumpMachine("dump.txt");
       ResetAll(qubits);
   }
}
