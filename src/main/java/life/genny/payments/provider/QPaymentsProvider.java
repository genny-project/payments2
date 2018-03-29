package life.genny.payments.provider;

import org.json.simple.JSONObject;

public interface QPaymentsProvider {
	
	public JSONObject createUser(JSONObject userObj);
	public JSONObject createCompany(JSONObject companyObj);
	

}
