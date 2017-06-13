package com.cve.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cve.dao.IVuln_typeDAO;
import com.cve.vo.Vuln_type;

public class Vuln_typeDAOImpl implements IVuln_typeDAO {

	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public Vuln_typeDAOImpl(Connection conn) {
		this.conn = conn;
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean insertVulntype(Vuln_type vuln_type) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "insert into vuln_type (type_name, proportion) values (?, ?)";
		this.ps = this.conn.prepareStatement(sql);
		
		this.ps.setString(1, vuln_type.getType_name());
		this.ps.setFloat(2, vuln_type.getProportion());
		
		if( this.ps.executeUpdate() > 0 ){
			flag = true;
		}
		this.ps.close();
		return flag;
	}

	@Override
	public boolean deletetVulntype(String typename) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "delete from vuln_type where type_name=?";
		this.ps = this.conn.prepareStatement(sql);
		
		this.ps.setString(1, typename);
		
		if( this.ps.executeUpdate() > 0 ){
			flag = true;
		}
		this.ps.close();
		return flag;
	}

	@Override
	//update type_name
	public boolean updateVulntype(String new_typename, String old_typename) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "update vuln_type set type_name=? where type_name=?";
		this.ps = this.conn.prepareStatement(sql);
		
		this.ps.setString(1, new_typename);
		this.ps.setString(2, old_typename);
		
		if( this.ps.executeUpdate() > 0 ){
			flag = true;
		}
		this.ps.close();
		return flag;
	}

	@Override
	public Vuln_type queryByname(String typename) throws Exception {
		// TODO Auto-generated method stub
		Vuln_type vuln_type = null;
		String sql = "select * from vuln_type where type_name=?";
		this.ps = this.conn.prepareStatement(sql);
		
		this.ps.setString(1, typename);
		ResultSet rs = this.ps.executeQuery();
		
		while( rs.next() ){
			vuln_type = new Vuln_type();
			vuln_type.setTid(rs.getInt("tid"));
			vuln_type.setType_name(rs.getString("type_name"));
			vuln_type.setProportion(rs.getFloat("proportion"));
		}
		
		this.ps.close();
		return vuln_type;
	}

}
