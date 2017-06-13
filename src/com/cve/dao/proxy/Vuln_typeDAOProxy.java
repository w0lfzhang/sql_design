package com.cve.dao.proxy;

import com.cve.dao.IVuln_typeDAO;
import com.cve.dao.impl.Vuln_typeDAOImpl;
import com.cve.dbc.DatabaseConnection;
import com.cve.vo.Vuln_type;

public class Vuln_typeDAOProxy implements IVuln_typeDAO {

	private DatabaseConnection dbc = null;
	private IVuln_typeDAO dao = null;
	
	public Vuln_typeDAOProxy() throws Exception{
		// TODO Auto-generated constructor stub
		this.dbc = new DatabaseConnection();
		this.dao = new Vuln_typeDAOImpl(this.dbc.getConnection());
	}
	
	@Override
	public boolean insertVulntype(Vuln_type vuln_type) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			if( this.dao.queryByname(vuln_type.getType_name()) == null ){
				flag = this.dao.insertVulntype(vuln_type);
			}
		}catch( Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public boolean deletetVulntype(String typename) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			if( this.dao.queryByname(typename) != null ){
				flag = this.dao.deletetVulntype(typename);
			}
		}catch( Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public boolean updateVulntype(String new_typename, String old_typename) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			if( this.dao.queryByname(old_typename) != null ){
				flag = this.dao.updateVulntype(new_typename, old_typename);
			}
		}catch( Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public Vuln_type queryByname(String typename) throws Exception {
		// TODO Auto-generated method stub
		Vuln_type vuln_type = null;
		try{
			vuln_type = this.dao.queryByname(typename);
		}
		catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return vuln_type;
	}

}
