package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.catalogue;
import model.bean.detail;
import model.bean.image;

public class HoiAn_DAO {

	public Statement connectDB() throws Exception
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/cnw_hoian";
		String user = "root";
		String pw = "";
		Connection cnt = (Connection) DriverManager.getConnection(url, user, pw);
		Statement st = cnt.createStatement();
		return st;
	}
	public int dangnhap(String username, String password) throws Exception
	{
		Statement st = connectDB();
		ResultSet rs = st.executeQuery("SELECT * FROM admin WHERE Username= '" + username + "'");
		while(rs.next())
		{
			if(rs.getString(3).equals(password))
				return 1;
			else {
				return 2;
			}
		}
		return 3;
	}
	public ArrayList<catalogue> getAllCatalogues() throws Exception {
		Statement st = connectDB();
		ResultSet rs = st.executeQuery("SELECT * FROM catalogue");
		ArrayList<catalogue> listcatalogue = new ArrayList<catalogue>();
		catalogue c = null;
		while(rs.next())
		{
			c = new catalogue();
			c.setID_Catalogue(rs.getString("ID_Catalogue"));
			c.setName_Catalogue(rs.getString("Name_Catalogue"));
			listcatalogue.add(c);
		}
		return listcatalogue;
	}
	public boolean checkID_Catalogue(String ID_Catalogue) throws Exception {
		Statement st = connectDB();
		ResultSet rs = st.executeQuery("SELECT * FROM catalogue WHERE ID_Catalogue = '" + ID_Catalogue + "'");
		while(rs.next())
		{
			return false;
		}
		return true;
	}
	public int addCatalogue(String ID_Catalogue, String Name_Catalogue) throws Exception {
		Statement st = connectDB();
		int rs = st.executeUpdate("INSERT INTO catalogue VALUE ('" + ID_Catalogue + "', '" + Name_Catalogue + "')");
		return rs;
	}
	public catalogue getCatalogues(String ID_Catalogue) throws Exception {
		Statement st = connectDB();
		ResultSet rs = st.executeQuery("SELECT * FROM catalogue WHERE ID_Catalogue = '" + ID_Catalogue + "'");
		catalogue c = null;
		while(rs.next())
		{
			c = new catalogue();
			c.setID_Catalogue(rs.getString("ID_Catalogue"));
			c.setName_Catalogue(rs.getString("Name_Catalogue"));
		}
		return c;
	}
	public int updateCatalogue(String ID_Catalogue, String Name_Catalogue) throws Exception {
		Statement st = connectDB();
		int rs = st.executeUpdate("UPDATE catalogue SET Name_Catalogue='" + Name_Catalogue + "' WHERE ID_Catalogue='" + ID_Catalogue + "'");
		return rs;
	}
	public int deleteCatalogue(String ID_Catalogue) throws Exception {
		Statement st = connectDB();
		int rs = st.executeUpdate("DELETE FROM catalogue WHERE ID_Catalogue='" + ID_Catalogue + "'");
		return rs;
	}
	public ArrayList<detail> getDetailsOfCatalogue(String ID_Catalogue) throws Exception {
		Statement st = connectDB();
		ResultSet rs = st.executeQuery("SELECT * FROM detail_catalogue WHERE ID_Catalogue='" + ID_Catalogue + "'");
		ArrayList<detail> listdetail = new ArrayList<detail>();
		detail d = null;
		while(rs.next())
		{
			d = new detail();
			d.setCatalogue(getCatalogues(ID_Catalogue));
			d.setID_Detail(rs.getString("ID_Detail"));
			d.setTitle(rs.getString("Title"));
			d.setName(rs.getString("Name"));
			d.setContent(rs.getString("Content"));
			d.setOther(rs.getString("Other"));
			d.setListImages(getImage(d.getID_Detail()));
			listdetail.add(d);
		}
		return listdetail;
	}
	public ArrayList<image> getImage(String ID_Detail) throws Exception {
		Statement st = connectDB();
		ResultSet rs = st.executeQuery("SELECT * FROM album WHERE ID_Detail='" + ID_Detail + "'");
		ArrayList<image> album = new ArrayList<image>();
		image img = null;
		while(rs.next())
		{
			img = new image();
			img.setID_Detail(ID_Detail);
			img.setID_Image(rs.getString("ID_Image"));
			img.setImage(rs.getString("Image"));
			img.setDescription(rs.getString("Description"));
			album.add(img);
		}
		return album;
	}
	public boolean checkID_Detail(String ID_Detail) throws Exception {
		Statement st = connectDB();
		ResultSet rs = st.executeQuery("SELECT * FROM detail_catalogue WHERE ID_Detail = '" + ID_Detail + "'");
		while(rs.next())
		{
			return false;
		}
		return true;
	}
	public int addDetail(detail dt) throws Exception {
		Statement st = connectDB();
		int rs = st.executeUpdate("INSERT INTO detail_catalogue VALUE ('" + dt.getCatalogue().getID_Catalogue() + "', '" + dt.getID_Detail() + "', '" 
		+ dt.getTitle() + "', '" + dt.getName() + "', '" + dt.getContent() + "', '" + dt.getOther() + "')");
		return rs;
	}
	public boolean checkID_Image(String ID_Image) throws Exception {
		Statement st = connectDB();
		ResultSet rs = st.executeQuery("SELECT * FROM album WHERE ID_Image = '" + ID_Image + "'");
		while(rs.next())
		{
			return false;
		}
		return true;
	}
	public int addImage(image img) throws Exception {
		Statement st = connectDB();
		int rs = st.executeUpdate("INSERT INTO album VALUE ('" + img.getID_Detail() + "', '" + img.getID_Image() + "', '" + img.getImage() + "', '" + img.getDescription() + "')");
		return rs;
	}
	public detail getDetail(String ID_Detail) throws Exception {
		Statement st = connectDB();
		ResultSet rs = st.executeQuery("SELECT * FROM detail_catalogue WHERE ID_Detail='" + ID_Detail + "'");
		detail d = null;
		while(rs.next())
		{
			d = new detail();
			d.setCatalogue(getCatalogues(rs.getString("ID_Catalogue")));
			d.setID_Detail(rs.getString("ID_Detail"));
			d.setTitle(rs.getString("Title"));
			d.setName(rs.getString("Name"));
			d.setContent(rs.getString("Content"));
			d.setOther(rs.getString("Other"));
			d.setListImages(getImage(d.getID_Detail()));
		}
		return d;
	}
	public int updateDetail(detail dt) throws Exception {
		Statement st = connectDB();
		int rs = st.executeUpdate("UPDATE detail_catalogue SET Title='" + dt.getTitle() + "', Name='" + dt.getName() 
		+ "', Content='" + dt.getContent() + "', Other='" + dt.getOther() + "' WHERE ID_Detail='" + dt.getID_Detail() + "'");
		return rs;
	}
	public int updateImage(image img) throws Exception {
		Statement st = connectDB();
		int rs = st.executeUpdate("UPDATE album SET Image='" + img.getImage() + ", Description='" + img.getDescription() + "' WHERE ID_Image='" + img.getID_Image() + "'");
		return rs;
	}
	public int deleteDetailOfCatalogue(String ID_Catalogue) throws Exception {
		Statement st = connectDB();
		int rs = st.executeUpdate("DELETE FROM detail_catalogue WHERE ID_Catalogue='" + ID_Catalogue + "'");
		return rs;
	}
	public int deleteDetail(String ID_Detail) throws Exception {
		Statement st = connectDB();
		int rs = st.executeUpdate("DELETE FROM detail_catalogue WHERE ID_Detail='" + ID_Detail + "'");
		return rs;
	}
	public int deleteImagesOfDetail(String ID_Detail) throws Exception {
		Statement st = connectDB();
		int rs = st.executeUpdate("DELETE FROM album WHERE ID_Detail='" + ID_Detail + "'");
		return rs;
	}
	public int deleteImage(String ID_Image) throws Exception {
		Statement st = connectDB();
		int rs = st.executeUpdate("DELETE FROM album WHERE ID_Image='" + ID_Image + "'");
		return rs;
	}
}
