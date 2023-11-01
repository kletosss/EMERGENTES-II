
package com.emergentes.controlador;
import com.emergentes.modelo.Categoria;
import com.emergentes.modelo.Libro;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LibrosController", urlPatterns = {"/LibrosController"})
public class LibrosController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = (request.getParameter("op").equals(""))? "listar" : request.getParameter("op");
        Categoria c = new Categoria(0," ");
        Libro lib = new Libro(0,"","","",c);
        int id;
        HttpSession ses = request.getSession();
        List<Libro> lista = (List<Libro>)ses.getAttribute("biblioteca");
        List<Categoria> categorias = (List<Categoria>)ses.getAttribute("cates");
        
        switch(op)
        {
            case "nuevo":
                if(lista.size()== 0)
                {
                    lib.setId(1);
                }
                else 
                {
                    lib.setId(lista.get(lista.size()-1).getId()+1);
                }
                request.setAttribute("categorias", categorias);
                request.setAttribute("lib", lib);
                request.setAttribute("tipo", "new");
                request.getRequestDispatcher("LibrosEdit.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                lib =lista.get(posNodoLibro(id,request));
                request.setAttribute("categorias", categorias);
                request.setAttribute("lib", lib);
                request.setAttribute("tipo", "edit");
                request.getRequestDispatcher("LibrosEdit.jsp").forward(request, response);
                break;
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                int pos = posNodoLibro(id,request);
                lista.remove(pos);
                response.sendRedirect("Libros.jsp");
                break;
            case "listar":
                request.setAttribute("biblioteca", lista);
                response.sendRedirect("Libros.jsp");
                break;
        }
    }   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String disponibilidad = request.getParameter("disponibilidad");
        int idcat = Integer.parseInt(request.getParameter("idcat"));
        Categoria cate = nodoCategoria(idcat,request);
        
        String tipo = request.getParameter("tipo");
        
        Libro l = new Libro();
        l.setId(id);
        l.setTitulo(titulo);
        l.setAutor(autor);
        l.setDisponibilidad(disponibilidad);
        l.setCate(cate);
        
        HttpSession ses = request.getSession();
        List<Libro> biblioteca = (List<Libro>)ses.getAttribute("biblioteca");
        
        
        if(tipo.equals("new"))
        {
            biblioteca.add(l);
        }
        else 
        {
            biblioteca.set(posNodoLibro(id,request), l);
        }
        response.sendRedirect("Libros.jsp");
    }
    
    public int posNodoLibro(int id, HttpServletRequest request)
    {
        int index=-1;
        HttpSession ses = request.getSession();
        List<Libro> lista = (List<Libro>)ses.getAttribute("biblioteca");
        for(int i = 0; i< lista.size();i++)
        {
            if(lista.get(i).getId() == id)
            {
                index=i;
                break;
            }
        }
        return index;
    }
    
    public int posNodoCategoria(int id, HttpServletRequest request)
    {
        int index =-1;
        HttpSession ses = request.getSession();
        List<Categoria> lista = (List<Categoria>)ses.getAttribute("cates");
        for(int i=0;i< lista.size();i++)
        {
            if(lista.get(i).getId()==id)
            {
                index = i;
                break;
            }
        }
        return index;
    }
    
    public Categoria nodoCategoria(int id,HttpServletRequest request)
    {
        Categoria aux = new Categoria();
        HttpSession ses = request.getSession();
        List<Categoria> lista = (List<Categoria>)ses.getAttribute("cates");
        for(Categoria obj : lista)
        {
            if(obj.getId()==id)
            {
                aux=obj;
            }
        }
        return aux;
    }
            
}
