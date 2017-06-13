package com.cve.dao;

import java.util.List;
import com.cve.vo.Cve;

//**all operations of table cve***//

public interface ICveDAO {
	public boolean insertCve(Cve cve) throws Exception;
	
	public boolean deleteCve(String cvename) throws Exception;
	
	public boolean updateCve(String new_cvename, String old_cvename, String description) throws Exception;
	
	public Cve queryByName(String cvename) throws Exception;
	
	public List<Cve> queryByauthor(String author) throws Exception;
	
	public List<Cve> queryByappname(String appname) throws Exception;
	
	public List<Cve> queryBycompany(String company) throws Exception;
	
	public List<Cve> queryByAuthorandAppname(String author, String appname) throws Exception;
	
	public Cve queryBymany(String cvename, String author, String company, String appname) throws Exception;
	
	public List<Cve> queryByfuzzy(String fuzzy) throws Exception;
}
