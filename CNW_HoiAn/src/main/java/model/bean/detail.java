package model.bean;

import java.util.ArrayList;

public class detail {
	private catalogue Catalogue;
	private String ID_Detail;
	private String Title;
	private String Name;
	private String Content;
	private String Other;
	private ArrayList<image> ListImages;
	
	public catalogue getCatalogue() {
		return Catalogue;
	}
	public void setCatalogue(catalogue Catalogue) {
		this.Catalogue = Catalogue;
	}
	public String getID_Detail() {
		return ID_Detail;
	}
	public void setID_Detail(String ID_Detail) {
		this.ID_Detail = ID_Detail;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String Title) {
		this.Title = Title;
	}
	public String getName() {
		return Name;
	}
	public void setName(String Name) {
		this.Name = Name;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String Content) {
		this.Content = Content;
	}
	public String getOther() {
		return Other;
	}
	public void setOther(String Other) {
		this.Other = Other;
	}
	public ArrayList<image> getListImages() {
		return ListImages;
	}
	public void setListImages(ArrayList<image> ListImages) {
		this.ListImages = ListImages;
	}
	
}
