package com.cve.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cve.dao.ICveDAO;
import com.cve.vo.Cve;

public class CveDAOImpl implements ICveDAO {

	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public CveDAOImpl(Connection conn){
		this.conn = conn;
	}
	
	@Override
	public boolean insertCve(Cve cve) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "insert into cve (cve_name, author, published_time, description, type, app_name, " 
				+ "company, platform) values (?, ?, ?, ?, ?, ?, ?, ?)";
		this.ps = this.conn.prepareStatement(sql);
		
		this.ps.setString(1, cve.getCve_name());
		this.ps.setString(2, cve.getAuthour());
		this.ps.setDate(3, new java.sql.Date(cve.getPublished_time().getTime()));
		this.ps.setString(4, cve.getDescription());
		this.ps.setInt(5, cve.getType());
		this.ps.setString(6, cve.getApp_name());
		this.ps.setString(7, cve.getCompany());
		this.ps.setString(8, cve.getPlatform());
		
		if( this.ps.executeUpdate() > 0 ){
			flag = true;
		}
		this.ps.close();
		return flag;
	}

	@Override
	public boolean deleteCve(String cvename) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "delete from cve where cve_name=?";
		this.ps = this.conn.prepareStatement(sql);
		
		this.ps.setString(1, cvename);
		
		if( this.ps.executeUpdate() > 0 ){
			flag = true;
		}
		this.ps.close();
		return flag;
	}

	@Override
	//just update cve_name
	public boolean updateCve(String new_cvename, String old_cvename) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "update cve set cve_name=? where cve_name=?";
		this.ps = this.conn.prepareCall(sql);
		this.ps.setString(1, new_cvename);
		this.ps.setString(2, old_cvename);
		
		if( this.ps.executeUpdate() > 0 ){
			flag = true;
		}
		this.ps.close();
		return flag;
	}

	@Override
	public Cve queryByName(String cvename) throws Exception {
		// TODO Auto-generated method stub
		Cve cve = null;
		String sql = "select * from cve where cve_name=?";
		this.ps = this.conn.prepareStatement(sql);
		this.ps.setString(1, cvename);
		
		ResultSet rs = this.ps.executeQuery();
		
		while( rs.next() ){
			cve = new Cve();
			cve.setCid(rs.getInt("cid"));
			cve.setCve_name(rs.getString("cve_name"));
			cve.setAuthour(rs.getString("author"));
			cve.setPublished_time(rs.getDate("published_time"));
			cve.setDescription(rs.getString("description"));
			cve.setType(rs.getInt("type"));
			cve.setApp_name(rs.getString("app_name"));
			cve.setCompany(rs.getString("company"));
			cve.setPlatform(rs.getString("platform"));
		}
		
		this.ps.close();
		return cve;
	}
	
    public List<Cve> queryByauthor(String author) throws Exception{
    	List<Cve> all = new ArrayList<Cve>();
		String sql = "select * from cve where author=?";
		this.ps = this.conn.prepareStatement(sql);
		
		this.ps.setString(1, author);
		
		ResultSet rs = this.ps.executeQuery();
		Cve cve = null;
		while (rs.next() ){
			cve = new Cve();
			cve.setCid(rs.getInt("cid"));
			cve.setCve_name(rs.getString("cve_name"));
			cve.setAuthour(rs.getString("author"));
			cve.setPublished_time(rs.getDate("published_time"));
			cve.setDescription(rs.getString("description"));
			cve.setType(rs.getInt("type"));
			cve.setApp_name(rs.getString("app_name"));
			cve.setCompany(rs.getString("company"));
			cve.setPlatform(rs.getString("platform"));
			all.add(cve);
		}
		
		this.ps.close();
		return all;
    }
	
	public List<Cve> queryByappname(String appname) throws Exception{
		List<Cve> all = new ArrayList<Cve>();
		String sql = "select * from cve where app_name=?";
		this.ps = this.conn.prepareStatement(sql);
		
		this.ps.setString(1, appname);
		
		ResultSet rs = this.ps.executeQuery();
		Cve cve = null;
		while (rs.next() ){
			cve = new Cve();
			cve.setCid(rs.getInt("cid"));
			cve.setCve_name(rs.getString("cve_name"));
			cve.setAuthour(rs.getString("author"));
			cve.setPublished_time(rs.getDate("published_time"));
			cve.setDescription(rs.getString("description"));
			cve.setType(rs.getInt("type"));
			cve.setApp_name(rs.getString("app_name"));
			cve.setCompany(rs.getString("company"));
			cve.setPlatform(rs.getString("platform"));
			all.add(cve);
		}
		
		this.ps.close();
		return all;
	}
	
	public List<Cve> queryBycompany(String company) throws Exception{
		List<Cve> all = new ArrayList<Cve>();
		String sql = "select * from cve where company=?";
		this.ps = this.conn.prepareStatement(sql);
		
		this.ps.setString(1, company);
		
		ResultSet rs = this.ps.executeQuery();
		Cve cve = null;
		while (rs.next() ){
			cve = new Cve();
			cve.setCid(rs.getInt("cid"));
			cve.setCve_name(rs.getString("cve_name"));
			cve.setAuthour(rs.getString("author"));
			cve.setPublished_time(rs.getDate("published_time"));
			cve.setDescription(rs.getString("description"));
			cve.setType(rs.getInt("type"));
			cve.setApp_name(rs.getString("app_name"));
			cve.setCompany(rs.getString("company"));
			cve.setPlatform(rs.getString("platform"));
			all.add(cve);
		}
		
		this.ps.close();
		return all;
	}

	@Override
	public Cve queryBymany(String cvename, String author, String company, String appname) throws Exception {
		// TODO Auto-generated method stub
		Cve cve = null;
		String sql = "select * from cve where cve_name=? and author=? and company=? and app_name=?";
		this.ps = this.conn.prepareStatement(sql);
		this.ps.setString(1, cvename);
		this.ps.setString(2, author);
		this.ps.setString(3, company);
		this.ps.setString(4, appname);
		
		ResultSet rs = this.ps.executeQuery();
		
		while( rs.next() ){
			cve = new Cve();
			cve.setCid(rs.getInt("cid"));
			cve.setCve_name(rs.getString("cve_name"));
			cve.setAuthour(rs.getString("author"));
			cve.setPublished_time(rs.getDate("published_time"));
			cve.setDescription(rs.getString("description"));
			cve.setType(rs.getInt("type"));
			cve.setApp_name(rs.getString("app_name"));
			cve.setCompany(rs.getString("company"));
			cve.setPlatform(rs.getString("platform"));
		}
		
		this.ps.close();
		return cve;
	}

	public List<Cve> queryByfuzzy(String fuzzy) throws Exception{
		List<Cve> all = new ArrayList<Cve>();
		String sql = "select * from cve where cve_name like ? or author like ? or description like ? or app_name like ? or company like ?";
		this.ps = this.conn.prepareStatement(sql);
		
		this.ps.setString(1, "%" + fuzzy + "%");
		this.ps.setString(2, "%" + fuzzy + "%");
		this.ps.setString(3, "%" + fuzzy + "%");
		this.ps.setString(4, "%" + fuzzy + "%");
		this.ps.setString(5, "%" + fuzzy + "%");
		ResultSet rs = this.ps.executeQuery();
		Cve cve = null;
		while (rs.next() ){
			cve = new Cve();
			cve.setCid(rs.getInt("cid"));
			cve.setCve_name(rs.getString("cve_name"));
			cve.setAuthour(rs.getString("author"));
			cve.setPublished_time(rs.getDate("published_time"));
			cve.setDescription(rs.getString("description"));
			cve.setType(rs.getInt("type"));
			cve.setApp_name(rs.getString("app_name"));
			cve.setCompany(rs.getString("company"));
			cve.setPlatform(rs.getString("platform"));
			all.add(cve);
		}
		
		this.ps.close();
		return all;
	}
}
