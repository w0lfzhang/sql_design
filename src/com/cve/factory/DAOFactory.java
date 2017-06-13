package com.cve.factory;

import com.cve.dao.ICveDAO;
import com.cve.dao.IVuln_typeDAO;
import com.cve.dao.proxy.CveDAOProxy;
import com.cve.dao.proxy.Vuln_typeDAOProxy;

public class DAOFactory {

	public static ICveDAO getICveDAOInstance() throws Exception{
		return new CveDAOProxy();
	}
	
	public static IVuln_typeDAO getIVuln_typeDAOInstance() throws Exception{
		return new Vuln_typeDAOProxy();
	}
}
