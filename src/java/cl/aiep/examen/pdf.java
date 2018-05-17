package cl.aiep.examen;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "pdf", urlPatterns = {"/pdf"})
public class pdf extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre=request.getParameter("texto");
        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();
        try {
            try {
                Font chapterFont = FontFactory.getFont(FontFactory.HELVETICA, 26, Font.BOLDITALIC);
                Font paragraphFont = FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL);

                Font categoryFont = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD);
                Font subcategoryFont = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD);
                Font blueFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.RED);
                Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);

                Document documento = new Document();
                PdfWriter.getInstance(documento, out);
                PdfWriter.getInstance(documento, new FileOutputStream("C:/Users/TinTO/Desktop/Examen/web/imagenes/"+nombre+".pdf"));
                documento.open();
                
                Image imagen = Image.getInstance("C:/Users/TinTO/Desktop/Examen/web/imagenes/vader.png");
                imagen.setAlignment(Element.ALIGN_LEFT);               
                documento.add(imagen);

                Paragraph titulo = new Paragraph();
                titulo.add(new Phrase("Factura", chapterFont));
                titulo.setAlignment(Element.ALIGN_CENTER);
                titulo.add(new Phrase(Chunk.NEWLINE));
                titulo.add(new Phrase(Chunk.NEWLINE));
                documento.add(titulo);

                Paragraph descripcion = new Paragraph();
                descripcion.add(new Phrase("aqui va lo q sea", paragraphFont));
                descripcion.setAlignment(Element.ALIGN_CENTER);
                descripcion.add(new Phrase(Chunk.NEWLINE));
                descripcion.add(new Phrase(Chunk.NEWLINE));
                documento.add(descripcion);
                
                PdfPTable tabla = new PdfPTable(6);                
                PdfPCell celda1 = new PdfPCell(new Paragraph("Serie",categoryFont));
                PdfPCell celda2 = new PdfPCell(new Paragraph("Nombre",categoryFont));
                PdfPCell celda3 = new PdfPCell(new Paragraph("Descripcion",categoryFont));
                PdfPCell celda4 = new PdfPCell(new Paragraph("Cantidad",categoryFont));
                PdfPCell celda5 = new PdfPCell(new Paragraph("Precio Unitario",categoryFont));
                PdfPCell celda6 = new PdfPCell(new Paragraph("Subtotal",categoryFont));
              
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                tabla.addCell(celda3);
                tabla.addCell(celda4);
                tabla.addCell(celda5);
                tabla.addCell(celda6);
                
                documento.add(tabla);
                
                documento.close();
            } catch (Exception ex) {
                ex.getMessage();
            }

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
