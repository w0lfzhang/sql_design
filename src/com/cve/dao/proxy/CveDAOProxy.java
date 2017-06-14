package com.cve.dao.proxy;

import java.util.List;

import com.cve.dao.ICveDAO;
import com.cve.dao.impl.CveDAOImpl;
import com.cve.dbc.DatabaseConnection;
import com.cve.vo.Cve;

public class CveDAOProxy implements ICveDAO {

	private DatabaseConnection dbc = null;
	private ICveDAO dao = null;
	
	public CveDAOProxy() throws Exception{
		// TODO Auto-generated constructor stub
		this.dbc = new DatabaseConnection();
		this.dao = new CveDAOImpl(this.dbc.getConnection());
	}
	@Override
	public boolean insertCve(Cve cve) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			if( this.dao.queryByName(cve.getCve_name()) == null ){
				flag = this.dao.insertCve(cve);
			}
		}catch( Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public boolean deleteCve(String cvename) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			if( this.dao.queryByName(cvename) != null ){
				flag = this.dao.deleteCve(cvename);
			}
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public boolean updateCve(String new_cvename, String old_cvename, String description) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			if( this.dao.queryByName(old_cvename) != null && this.dao.queryByName(new_cvename) == null ){
				flag = this.dao.updateCve(new_cvename, old_cvename, description);
			}
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}
	
	public boolean updateCve(String old_cvename, String new_cvename, String author, String description, String appname, String company) throws Exception{
		boolean flag = false;
		try{
			if( this.dao.queryByName(old_cvename) != null && this.dao.queryByName(new_cvename) == null ){
				flag = this.dao.updateCve(old_cvename, new_cvename, author, description, appname, company);
			}
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}
	

	@Override
	public Cve queryByName(String cvename) throws Exception {
		// TODO Auto-generated method stub
		Cve cve = null;
		try{
			cve = this.dao.queryByName(cvename);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return cve;
	}
	
	public List<Cve> queryByauthor(String author) throws Exception{
		List<Cve> all = null;
		try{
			all = this.dao.queryByauthor(author);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}
	
	public List<Cve> queryByappname(String appname) throws Exception{
		List<Cve> all = null;
		try{
			all = this.dao.queryByappname(appname);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}
	
	public List<Cve> queryBycompany(String company) throws Exception{
		List<Cve> all = null;
		try{
			all = this.dao.queryBycompany(company);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}

	@Override
	public Cve queryBymany(String cvename, String author, String company, String appname) throws Exception {
		// TODO Auto-generated method stub
		Cve cve = null;
		try{
			cve = this.dao.queryBymany(cvename, author, company, appname);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return cve;
	}

	public List<Cve> queryByAuthorandAppname(String author, String appname) throws Exception{
		List<Cve> all = null;
		try{
			all = this.dao.queryByAuthorandAppname(author, appname);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}
	public List<Cve> queryByfuzzy(String fuzzy) throws Exception{
		List<Cve> all = null;
		try{
			all = this.dao.queryByfuzzy(fuzzy);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}
}
