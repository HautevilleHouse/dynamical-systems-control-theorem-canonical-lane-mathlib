import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsControlTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DynamicalWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse