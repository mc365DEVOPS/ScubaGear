package exo_test
import rego.v1
import data.exo
import data.utils.key.TestResult
import data.utils.key.FAIL
import data.utils.key.PASS


#
# Policy MS.EXO.13.1v1
#--
test_AuditDisabled_Correct if {
    Output := exo.tests with input.org_config as [OrgConfig]

    TestResult("MS.EXO.13.1v1", Output, PASS, true) == true
}

test_AuditDisabled_Incorrect if {
    OrgConfig1 := json.patch(OrgConfig, [{"op": "add", "path": "AuditDisabled", "value": true}])

    Output := exo.tests with input.org_config as [OrgConfig1]

    TestResult("MS.EXO.13.1v1", Output, FAIL, false) == true
}
#--