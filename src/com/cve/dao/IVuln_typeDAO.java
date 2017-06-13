package com.cve.dao;

import com.cve.vo.Vuln_type;

public interface IVuln_typeDAO {

	public boolean insertVulntype(Vuln_type vuln_type) throws Exception;
	
	public boolean deletetVulntype(String typename) throws Exception;
	
	public boolean updateVulntype(String new_typename, String old_typename) throws Exception;
	
	public Vuln_type queryByname(String typename) throws Exception;
}
