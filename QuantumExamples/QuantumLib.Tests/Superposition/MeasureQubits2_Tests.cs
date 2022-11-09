using System;
using System.IO;
using QuantumExamples.QuantumLib;

namespace QuantumExamples.QuantumLib.Tests
{
    public class MeasureQubits2_Tests
    {
        [Fact]
        public void BeOfSpecifiedLength()
        {
            int length = 4;

            using (var oQuantumSimulator = new QuantumSimulator())
            {
                var result = MeasureQubits2.Run(oQuantumSimulator, length).Result;
                Assert.Equal(length, result.Count);
            }
        }
    }
}
