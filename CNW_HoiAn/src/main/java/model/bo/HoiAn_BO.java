package model.bo;

import java.sql.Statement;
import java.util.ArrayList;

import model.bean.catalogue;
import model.bean.detail;
import model.bean.image;
import model.dao.HoiAn_DAO;

public class HoiAn_BO {
	HoiAn_DAO hoiAn_DAO = new HoiAn_DAO();
	public int dangnhap(String username, String password) throws Exception
	{
		return hoiAn_DAO.dangnhap(username, password);
	}
	public ArrayList<catalogue> getAllCatalogues() throws Exception {
		return hoiAn_DAO.getAllCatalogues();
	}
	public boolean checkIDCatalogue(String ID_Catalogue) throws Exception {
		if(hoiAn_DAO.checkID_Catalogue(ID_Catalogue) == true)
		{
				return true;
		}
		return false;
	}
	public boolean addCatalogue(String ID_Catalogue, String Name_Catalogue) throws Exception {
		if (hoiAn_DAO.addCatalogue(ID_Catalogue, Name_Catalogue) == 1) {
			return true;
		}
		return false;
	}
	public catalogue getCatalogues(String ID_Catalogue) throws Exception {
		return hoiAn_DAO.getCatalogues(ID_Catalogue);
	}
	public boolean updateCatalogue(String ID_Catalogue, String Name_Catalogue) throws Exception {
		if(hoiAn_DAO.updateCatalogue(ID_Catalogue, Name_Catalogue) != 0)
		{
			return true;
		}
		return false;
	}
	public boolean deleteCatalogue(String ID_Catalogue) throws Exception {
		ArrayList<detail> dt = hoiAn_DAO.getDetailsOfCatalogue(ID_Catalogue);
		int i;
		for(int k=0; k<dt.size(); k++)
		{
			i = hoiAn_DAO.deleteImagesOfDetail(dt.get(k).getID_Detail());
		}
		int d = hoiAn_DAO.deleteDetailOfCatalogue(ID_Catalogue);
		int c = hoiAn_DAO.deleteCatalogue(ID_Catalogue);
		if(c != 0) return true;
		return false;
	}
	public ArrayList<detail> getDetailsOfCatalogue(String ID_Catalogue) throws Exception {
		return hoiAn_DAO.getDetailsOfCatalogue(ID_Catalogue);
	}
	public boolean checkIDDetail(String ID_Detail) throws Exception {
		if(hoiAn_DAO.checkID_Detail(ID_Detail) == true)
		{
				return true;
		}
		return false;
	}
	public boolean addDetail(detail dt) throws Exception {
		if (hoiAn_DAO.addDetail(dt) == 1) {
			return true;
		}
		return false;
	}
	public boolean checkIDImg(String ID_Img) throws Exception {
		if(hoiAn_DAO.checkID_Image(ID_Img) == true)
		{
				return true;
		}
		return false;
	}
	public boolean addImage(image img) throws Exception {
		if (hoiAn_DAO.addImage(img) == 1) {
			return true;
		}
		return false;
	}
	public detail getDetail(String ID_Detail) throws Exception {
		return hoiAn_DAO.getDetail(ID_Detail);
	}
	public boolean updateDetail(detail dt) throws Exception {
		if(hoiAn_DAO.updateDetail(dt) != 0)
		{
			return true;
		}
		return false;
	}
	public boolean updateImage(image img) throws Exception {
		if(hoiAn_DAO.updateImage(img) != 0)
		{
			return true;
		}
		return false;
	}
	public boolean deleteDetail(String ID_Detail) throws Exception {
		int	i = hoiAn_DAO.deleteImagesOfDetail(ID_Detail);
		int d = hoiAn_DAO.deleteDetail(ID_Detail);
		if(d != 0) return true;
		return false;
	}
	public boolean deleteImage(String ID_Image) throws Exception {
		int	i = hoiAn_DAO.deleteImage(ID_Image);
		if(i != 0) return true;
		return false;
	}
}