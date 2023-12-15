package controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.catalogue;
import model.bean.detail;
import model.bean.image;
import model.bo.HoiAn_BO;

@WebServlet("/HoiAn_Servlet")
public class HoiAn_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet (HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}
	protected void doPost (HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException
	{
		String destination = null;
		HoiAn_BO hoiAn_BO = new HoiAn_BO();
		if(request.getParameter("dangnhap") != null)
		{
			if(request.getParameter("submit") != null)
			{
				try {
					String warning = "";
					int check = hoiAn_BO.dangnhap(request.getParameter("Username"), request.getParameter("Password"));
					if(check == 1)
					{
						destination = "/indexAdmin.jsp";
						RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
						rd.forward(request, response);
					}
					else if (check == 2) {
						warning = "Sai mật khẩu!";
						request.setAttribute("warning", warning);
						destination = "/DangNhap.jsp";
						RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
						rd.forward(request, response);
					}
					else{
						warning = "Sai tên đăng nhập!";
						request.setAttribute("warning", warning);
						destination = "/DangNhap.jsp";
						RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
						rd.forward(request, response);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			else {
				destination = "/DangNhap.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			}
		}
		else if(request.getParameter("catalogue") != null)
		{
			if(request.getParameter("Add") != null)
			{	
				if(request.getParameter("checkIDCatalogue") != null)
				{
					try {
						boolean check = hoiAn_BO.checkIDCatalogue(request.getParameter("checkIDCatalogue"));
						if(check == false)
						{
							response.getWriter().write("This id has already been used!");
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else {
					destination = "/AddCatalogue.jsp";
					RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
					rd.forward(request, response);
				}
			}
			else if(request.getParameter("AddSave") != null)
			{
				try {
					boolean check = hoiAn_BO.addCatalogue(request.getParameter("ID_Catalogue"), request.getParameter("Name_Catalogue"));
					if(check)
					{
						response.sendRedirect("HoiAn_Servlet?catalogue=1");
					}
					else {
						destination = "/AddCatalogue.jsp";
						RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
						rd.forward(request, response);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(request.getParameter("SaveUpdate") != null)
			{
				try {
					boolean check = hoiAn_BO.updateCatalogue(request.getParameter("ID_Catalogue"), request.getParameter("Name_Catalogue"));
					if(check)
					{
						response.sendRedirect("HoiAn_Servlet?catalogue=1");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(request.getParameter("updateid") != null)
			{	
				try {
					catalogue ctl = hoiAn_BO.getCatalogues(request.getParameter("updateid"));
					request.setAttribute("ctl", ctl);
					destination = "/UpdateCatalogue.jsp";
					RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
					rd.forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(request.getParameter("deleteid") != null)
			{	
				try {
					if(hoiAn_BO.deleteCatalogue(request.getParameter("deleteid")))
					{
						response.sendRedirect("HoiAn_Servlet?catalogue=1");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(request.getParameter("showid") != null)
			{	
				if(request.getParameter("SaveAddDetail") != null)
				{	
					try {
						detail dt = new detail();
						catalogue ctl = new catalogue();
						ctl.setID_Catalogue(request.getParameter("showid"));
						dt.setCatalogue(ctl);
						dt.setID_Detail(request.getParameter("ID_Detail"));
						dt.setTitle(request.getParameter("Title"));
						dt.setName(request.getParameter("Name"));
						dt.setContent(request.getParameter("Content"));
						dt.setOther(request.getParameter("Other"));
						boolean check = hoiAn_BO.addDetail(dt);
						if(check)
						{
							String id = "";
							String linkimg = "";
							String des = "";
							image img = null;
							int count = Integer.parseInt(request.getParameter("maxCounts"));
							for(int k=1; k <= count; k++)
							{
								id = "ID_Image" + k;
								linkimg = "img" + k;
								des = "des" + k;
								img = new image();
								if(request.getParameter(id) == null) continue; 
								img.setID_Detail(dt.getID_Detail());
								img.setID_Image(request.getParameter(id));
								img.setImage(request.getParameter(linkimg));
								img.setDescription(request.getParameter(des));
								boolean checkimg = hoiAn_BO.addImage(img);
								if(checkimg)
								{
									response.sendRedirect("HoiAn_Servlet?catalogue=1&showid=" + request.getParameter("showid"));
								}
							}
							response.sendRedirect("HoiAn_Servlet?catalogue=1&showid=" + request.getParameter("showid"));
						}
						else {
							ctl = hoiAn_BO.getCatalogues(request.getParameter("showid"));
							request.setAttribute("ctl", ctl);
							destination = "/AddDetail.jsp";
							RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
							rd.forward(request, response);
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(request.getParameter("addDetail") != null)
				{
					catalogue ctl;
					if(request.getParameter("checkIDDetail") != null)
					{
						try {
							boolean check = hoiAn_BO.checkIDDetail(request.getParameter("checkIDDetail"));
							if(check == false)
							{
								response.getWriter().write("This id_detail has already been used!");
							}
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					else if(request.getParameter("checkIDImg") != null)
					{
						try {
							boolean check = hoiAn_BO.checkIDImg(request.getParameter("checkIDImg"));
							if(check == false)
							{
								response.getWriter().write("This id_image has already been used!");
							}
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					else {
						try {
							ctl = hoiAn_BO.getCatalogues(request.getParameter("showid"));
							request.setAttribute("ctl", ctl);
							destination = "/AddDetail.jsp";
							RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
							rd.forward(request, response);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
				else if(request.getParameter("SaveUpdateDetail") != null)
				{
					try {
						detail dt = new detail();
						catalogue ctl = new catalogue();
						dt.setID_Detail(request.getParameter("ID_Detail"));
						dt.setTitle(request.getParameter("Title"));
						dt.setName(request.getParameter("Name"));
						dt.setContent(request.getParameter("Content"));
						dt.setOther(request.getParameter("Other"));
						boolean check = hoiAn_BO.updateDetail(dt);
						if(check)
						{
							String id = "";
							String linkimg = "";
							String des = "";
							image img = null;
							int count = Integer.parseInt(request.getParameter("maxCounts"));
							for(int k=1; k <= count; k++)
							{
								id = "ID_Image" + k;
								linkimg = "img" + k;
								des = "des" + k;
								img = new image();
								if(request.getParameter(id) == null) continue; 
								img.setID_Detail(dt.getID_Detail());
								img.setID_Image(request.getParameter(id));
								img.setImage(request.getParameter(linkimg));
								img.setDescription(request.getParameter(des));
								boolean checkimg = hoiAn_BO.addImage(img);
								if(checkimg)
								{
									response.sendRedirect("HoiAn_Servlet?catalogue=1&showid=" + request.getParameter("showid"));
								}
								else {
									destination = "/UpdateDetail.jsp";
									RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
									rd.forward(request, response);
								}
							}
							response.sendRedirect("HoiAn_Servlet?catalogue=1&showid=" + request.getParameter("showid"));
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(request.getParameter("updateDetailID") != null)
				{	
					if(request.getParameter("checkIDImg") != null)
					{
						try {
							boolean check = hoiAn_BO.checkIDImg(request.getParameter("checkIDImg"));
							if(check == false)
							{
								response.getWriter().write("This id_image has already been used!");
							}
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					else {
						try {
							detail dt = hoiAn_BO.getDetail(request.getParameter("updateDetailID"));
							request.setAttribute("dt", dt);
							destination = "/UpdateDetail.jsp";
							RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
							rd.forward(request, response);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
				else if(request.getParameter("deleteImage") != null)
				{	
					try {
						if(hoiAn_BO.deleteImage(request.getParameter("deleteImage")))
						{
							response.sendRedirect("HoiAn_Servlet?catalogue=1&showid=" + request.getParameter("showid") + "&updateDetailID=" + request.getParameter("imgIDDetail"));
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(request.getParameter("deleteDetailID") != null)
				{	
					try {
						if(hoiAn_BO.deleteDetail(request.getParameter("deleteDetailID")))
						{
							response.sendRedirect("HoiAn_Servlet?catalogue=1&showid=" + request.getParameter("showid"));
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else {
					try {
						ArrayList<detail> listDetails = hoiAn_BO.getDetailsOfCatalogue(request.getParameter("showid"));
						catalogue ctl = hoiAn_BO.getCatalogues(request.getParameter("showid"));
						request.setAttribute("ctl", ctl);
						request.setAttribute("listDetails", listDetails);
						destination = "/DetailCatalogue.jsp";
						RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
						rd.forward(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			else {
				try {
					ArrayList<catalogue> listCatalogues = hoiAn_BO.getAllCatalogues();
					request.setAttribute("listCatalogues", listCatalogues);
					destination = "/ListCatalogue.jsp";
					RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
					rd.forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}

}
