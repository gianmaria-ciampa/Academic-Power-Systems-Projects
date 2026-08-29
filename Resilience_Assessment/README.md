This project develops a methodology to identify the most vulnerable and critical components in electrical power networks under adverse events. The work combines reliability and resilience concepts with N‑1 security analysis, power flow studies, and vulnerability metrics using MATPOWER.

1.Introduction
The study provides an overview of reliability and resilience in power systems, describing how electrical networks respond to adverse events such as meteorological phenomena, geological hazards, and human‑related factors. It also reviews forecasting tools and strategies to enhance system resilience.
The final part of the introduction defines the objectives of the work.

2. Proposed Methodology

2.1 Data Loading and Spatio‑Temporal Load Profile Generation
Creation of load and generation profiles across different time horizons to simulate realistic operating conditions.

2.2 Network Operation Analysis Across Scenarios and Contingencies
Evaluation of system behavior under multiple combinations of load, generation, and outage scenarios.
N‑1 Static Security Analysis: Assessment of network robustness under single‑element outages.
Power Flow Study: Simulation of steady‑state operating conditions using MATPOWER.
Data Collection: Extraction of electrical quantities and performance indicators for each scenario.

2.3 Vulnerability and Criticality Metrics
Definition and computation of quantitative indicators to identify the most critical network components.

2.4 Operational Aspects of the Methodology
Practical considerations for implementing the workflow, including simulation management and data processing.

3. Case Studies
Two benchmark networks are analyzed to validate the methodology:
IEEE 9‑Bus System;
IEEE 24‑Bus RTS System.
Each case study includes contingency simulations, vulnerability assessment, and comparison of critical components.

4. Conclusions
Summary of findings regarding network resilience, identification of critical elements, and applicability of the proposed methodology to real‑world power systems.

Tools
MATLAB;
MATPOWER.

Contents
Simulation scripts;
Load and generation profiles; 
Contingency analysis results;
Vulnerability metrics;
Documentation and plots.

Summary
This project provides a resilience‑oriented framework for identifying critical components in high‑voltage networks. The methodology integrates N‑1 analysis, power flow simulations, and vulnerability metrics, supporting planning, reliability assessment, and risk‑aware operation of power systems.
