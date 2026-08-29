Ybus Matrix Construction for an Italian HV Network
This project develops the admittance matrix 𝑌𝑏𝑢𝑠 and the impedance matrix 𝑍𝑏𝑢s for a portion of the Italian high‑voltage (HV) transmission network. The work includes line parameter calculation, transformer modeling, and network assembly using MATLAB.

1. Project Overview
The study focuses on building the 𝑌𝑏𝑢𝑠 matrix of a real HV network (220 kV and 380 kV), including: overhead lines,cable lines, double‑circuit lines, autotransformers, realistic station and branch definitions.
The network includes at least 10 nodes, selected from Italian 220/380 kV grids.

2.1 Overhead Line Parameters
Line parameters per unit length (𝑟,𝑙,𝑐) are computed from geometric data:
conductor spacing, bundle configuration, distances 𝐷𝑎𝑏,𝐷𝑏𝑐,𝐷𝑐𝑎,𝐷𝑓, geometric mean distances, number of sub‑conductors (1 for 220 kV, 3 for 380 kV).
Lengths are obtained from station‑to‑station air distances multiplied by a correction factor.

2.2 Cable Line Parameters
For cable segments:
𝑥=0.17 Ω/𝑘𝑚
𝑐=250 𝑛𝐹/𝑘𝑚
𝑟380𝑘𝑉=0.02 Ω/𝑘𝑚
𝑟220𝑘𝑉=0.06 Ω/𝑘𝑚
Parallel cables and compensation reactors are included when required.

2.3 Autotransformer Modeling
Autotransformer data:

𝑉𝑛1=380 𝑘𝑉
𝑉𝑛2=220 𝑘𝑉
𝑆𝑛=400 𝑀𝑉𝐴
𝑉𝑐𝑐%=14%

All values are converted to per‑unit using:

𝑆𝑏=1000 𝑀𝑉𝐴
𝑉𝑏=220,380 𝑘𝑉

3. Network Assembly
The network is modeled using:
π‑equivalent circuits with hyperbolic functions, per‑unit conversion, node and branch definitions based on real Italian HV stations, maps from ENTSO‑E and OpenStreetMap.

4. Ybus Construction Algorithm
The 𝑌𝑏𝑢𝑠 matrix is assembled following the standard algorithm:
diagonal terms: sum of branch admittances connected to each node
off‑diagonal terms: negative of branch admittances between nodes
transformer admittances included as off‑nominal tap elements
final inversion to obtain 𝑍𝑏𝑢𝑠.

5. Tools
MATLAB
Custom scripts for line parameter calculation
Network mapping resources (ENTSO‑E, OSM)

6. Contents
MATLAB scripts for 𝑌𝑏𝑢𝑠 and 𝑍𝑏𝑢𝑠
line parameter calculation functions
transformer models
network data files
documentation and plots

Summary
This project provides a complete workflow for constructing the admittance matrix of a real Italian HV network, including detailed line modeling, transformer representation, and per‑unit conversion. The resulting 𝑌𝑏𝑢𝑠 and 𝑍𝑏𝑢𝑠 matrices form the basis for power flow studies and contingency analysis.
