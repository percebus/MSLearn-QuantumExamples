namespace QuantumExamples.HelloWorld {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    
    @EntryPoint()
    operation Run() : Unit {
        Message("Hello quantum world!");
    }
}
