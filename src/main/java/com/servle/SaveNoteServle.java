package com.servle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.*;
import com.helper.FactoryProvider;


public class SaveNoteServle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaveNoteServle() {
        super();
        // TODO Auto-generated constructor stub
    }
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		try{
			// title,content fetch
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			Note note = new Note(title,content,new Date());
			//System.out.println(note.getId()+":"+note.getTitle());
			//Hibernate.save()
		Session s=	FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		s.save(note);
		tx.commit();
		s.close();
		
		 session.setAttribute("note", "Note added successfully");
         
		
		 RequestDispatcher rd = request.getRequestDispatcher("all_notes.jsp");
         rd.forward(request, response);
		
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}
}
