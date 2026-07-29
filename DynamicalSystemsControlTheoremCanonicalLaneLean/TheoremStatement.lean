import HautevilleHouse.DynamicalSystemsControlTheoremCanonicalLaneLean.FinalTheorem
import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := sourceRepository,
  theoremName := sourceRepository,
  theoremObject := sourceDescription,
  classicalBoundary := sourceTheoremBoundary.claimBoundary,
  manifoldConstrainedStatement := "dynamical-systems-control theorem certificate internalized through bridge and gate closure",
  certificateLane := baselineCertificateLane,
  carriedRemainder := "classical source boundary carried by formalizationCertificate.theoremBoundaryOpen and sourceTheoremBoundary"
}

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse