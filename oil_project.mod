/*********************************************
 * OPL 22.1.1.0 Model
 * Author: garba
 * Creation Date: May 9, 2024 at 10:21:28 AM
 *********************************************/
/*********************************************
 * OPL 22.1.1.0 Model
 * Author: 113237
 * Creation Date: 4 kwi 2024 at 10:17:07
 *********************************************/
dvar float+ CRA;
dvar float+ CRB;
dvar float+ LNRG;
dvar float+ MNRG;
dvar float+ HNRG;
dvar float+ LOCGO;
dvar float+ HOCGO;
dvar float+ LN;
dvar float+ MN;
dvar float+ HN;
dvar float+ LO;
dvar float+ HO;
dvar float+ R;
dvar float+ RG;
dvar float+ CO;
dvar float+ CG;
dvar float+ RLBO;
dvar float+ LNPMF;
dvar float+ LNRMF;
dvar float+ LOJF;
dvar float+ HOJF;
dvar float+ COJF;
dvar float+ RJF;
dvar float+ MNPMF;
dvar float+ MNRMF;
dvar float+ HNPMF;
dvar float+ HNRMF;
dvar float+ RGPMF;
dvar float+ RGRMF;
dvar float+ CGPMF;
dvar float+ CGRMF;
dvar float+ LBO;
dvar float+ FO;
dvar float+ JF;
dvar float+ PMF;
dvar float+ RMF;


maximize 7*PMF + 6*RMF + 4*JF + 3.5*FO + 1.5*LBO;

subject to {
  CRA <= 20000;
  CRB <= 30000;
  CRA + CRB <= 45000;
  LNRG + MNRG + HNRG <= 10000;
  LOCGO + HOCGO <= 8000;
  LBO >= 500;
  LBO <= 1000;
  
  -0.1*CRA - 0.15*CRB + LN == 0;
  -0.2*CRA - 0.25*CRB + MN == 0;
  -0.2*CRA - 0.18*CRB + HN == 0;
  -0.12*CRA - 0.08*CRB + LO == 0;
  -0.2*CRA - 0.19*CRB + HO == 0;
  -0.13*CRA - 0.12*CRB + R == 0;
  
  -0.6*LNRG - 0.52*MNRG - 0.45*HNRG + RG == 0;
  
  -0.68 * LOCGO - 0.75 * HOCGO + CO == 0;
  -0.28 * LOCGO - 0.2 * HOCGO + CG == 0;
  
  -0.5*RLBO + LBO == 0;
  
  -LN + LNRG + LNPMF + LNRMF == 0;
  -MN + MNRG + MNPMF + MNRMF == 0;
  -HN + HNRG + HNPMF + HNRMF == 0;
  
  -LO + LOCGO + LOJF + 0.55 * FO == 0;
  -HO + HOCGO + HOJF + 0.16 * FO == 0;
  -CO + COJF + 0.22 * FO == 0;
  -R + RLBO + RJF + 0.05 * FO == 0;
  
  -LNPMF - MNPMF - HNPMF - RGPMF - CGPMF + PMF == 0;
  -LNRMF - MNRMF - HNRMF - RGRMF - CGRMF + RMF == 0;
  -LOJF - HOJF - RJF - COJF + JF == 0;
  
  -RGRMF - RGPMF + RG == 0;
  -CGRMF - CGPMF + CG == 0;
  
  PMF - 0.4 * RMF >= 0;
  -90 * LNPMF - 80 * MNPMF - 70 * HNPMF - 115 * RGPMF - 105 * CGPMF + 94 * PMF <= 0;
  -90 * LNRMF - 80 * MNRMF - 70 * HNRMF - 115 * RGRMF - 105 * CGRMF + 84 * RMF <= 0;
  -LOJF - 0.6 * HOJF - 1.5 * COJF - 0.05 * RJF + JF >= 0;
}
 