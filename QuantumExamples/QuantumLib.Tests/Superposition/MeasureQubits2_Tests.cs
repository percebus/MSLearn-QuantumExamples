using QuantumExamples.QuantumLib;


namespace QuantumExamples.QuantumLib.Tests
{
    public class MeasureQubits2_Tests
    {
        [Fact]
        public void Run_with_4_bits__returns__4()
        {
            int numOfBits = 4;
            using (var oQuantumSimulator = new QuantumSimulator())
            {
                var result = MeasureQubits2.Run(oQuantumSimulator, numOfBits).Result;
                Assert.Equal(numOfBits, result.Count);
            }
        }


        [Fact]
        public void Run_with_8_bits__returns__8()
        {
            int numOfBits = 8;
            using (var oQuantumSimulator = new QuantumSimulator())
            {
                var result = MeasureQubits2.Run(oQuantumSimulator, numOfBits).Result;
                Assert.Equal(numOfBits, result.Count);
            }
        }


        [Fact]
        public void sequential__Runs_with_8_bits__are_NotEqual()
        {
            int numOfBits = 8;
            using (var oQuantumSimulator = new QuantumSimulator())
            {
                var result1 = MeasureQubits2.Run(oQuantumSimulator, numOfBits).Result;
                var result2 = MeasureQubits2.Run(oQuantumSimulator, numOfBits).Result;
                Assert.NotEqual(result1, result2);
            }
        }
    }
}
